/// A screen that displays a scrollable list of videos fetched from the Pexels API.
library;

import 'package:flutter/material.dart';
import '../services/pexels_service.dart';
import 'video_player_screen.dart';

/// A [StatefulWidget] that fetches and displays videos based on [query].
class VideosScreen extends StatefulWidget {
  /// The search keyword to query from the Pexels API.
  final String query;

  /// A service instance for performing requests to the Pexels API.
  final PexelsService pexelsService;

  /// Creates a [VideosScreen] given a [query] and [pexelsService].
  const VideosScreen({
    super.key,
    required this.query,
    required this.pexelsService,
  });

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

/// Manages fetching and displaying a list of videos for [VideosScreen].
class _VideosScreenState extends State<VideosScreen> {
  /// Holds the future that retrieves the list of videos from the Pexels API.
  late Future<List<dynamic>> _videosFuture;

  @override
  void initState() {
    super.initState();
    // Fetch videos when this widget is first created.
    _videosFuture = widget.pexelsService.searchVideos(widget.query);
  }

  @override
  void didUpdateWidget(covariant VideosScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the search query changes, fetch new videos.
    if (oldWidget.query != widget.query) {
      setState(() {
        _videosFuture = widget.pexelsService.searchVideos(widget.query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _videosFuture,
      builder: (context, snapshot) {
        // Display a loading indicator while data is being fetched.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // If an error occurs, show the error message.
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // If no videos are found, show a fallback message.
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No videos found'));
        }

        final videos = snapshot.data!;
        return ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];

            // Extract the first video file link, if available.
            final videoFiles = video['video_files'] as List<dynamic>?;
            final videoUrl =
                (videoFiles != null && videoFiles.isNotEmpty)
                    ? videoFiles.first['link']
                    : null;

            // Extract the first video thumbnail, if available.
            final videoPictures = video['video_pictures'] as List<dynamic>?;
            final thumbnailUrl =
                (videoPictures != null && videoPictures.isNotEmpty)
                    ? videoPictures.first['picture']
                    : null;

            return ListTile(
              leading:
                  thumbnailUrl != null
                      ? Image.network(thumbnailUrl)
                      : Container(width: 64, color: Colors.grey),
              title: Text('Video ID: ${video['id']}'),
              subtitle: const Text('Tap to play'),
              onTap: () {
                if (videoUrl != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(videoUrl: videoUrl),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
