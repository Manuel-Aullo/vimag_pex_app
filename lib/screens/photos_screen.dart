/// A screen that displays a grid of photos fetched from the Pexels API.
library;

import 'package:flutter/material.dart';
import '../services/pexels_service.dart';

/// A stateful widget that shows photo results corresponding to [query].
class PhotosScreen extends StatefulWidget {
  /// The search keyword to query the Pexels API.
  final String query;

  /// A service instance for performing requests to the Pexels API.
  final PexelsService pexelsService;

  /// Creates a [PhotosScreen] given a [query] and a [pexelsService].
  const PhotosScreen({
    super.key,
    required this.query,
    required this.pexelsService,
  });

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

/// Manages fetching and displaying photo results for [PhotosScreen].
class _PhotosScreenState extends State<PhotosScreen> {
  /// Stores the future that retrieves the list of photos from the Pexels API.
  late Future<List<dynamic>> _photosFuture;

  @override
  void initState() {
    super.initState();
    // Initiate the first photo search when the widget is created.
    _photosFuture = widget.pexelsService.searchPhotos(widget.query);
  }

  @override
  void didUpdateWidget(covariant PhotosScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the query changes, fetch new photo results.
    if (oldWidget.query != widget.query) {
      setState(() {
        _photosFuture = widget.pexelsService.searchPhotos(widget.query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _photosFuture,
      builder: (context, snapshot) {
        // While data is loading, show a progress indicator.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // If there's an error, display it to the user.
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // If no data is found, display a fallback message.
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No photos found'));
        }

        // Otherwise, show the grid of photos.
        final photos = snapshot.data!;
        return GridView.builder(
          itemCount: photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the columns as needed.
          ),
          itemBuilder: (context, index) {
            final photo = photos[index];
            final src = photo['src'];
            // Use the 'medium' version of the image as a thumbnail.
            final thumbnailUrl = src?['medium'];
            return Card(
              child:
                  thumbnailUrl != null
                      ? Image.network(thumbnailUrl, fit: BoxFit.cover)
                      : Container(color: Colors.grey),
            );
          },
        );
      },
    );
  }
}
