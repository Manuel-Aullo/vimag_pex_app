/// A screen that plays a network video using the [video_player] package.
library;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// A [StatefulWidget] that receives a [videoUrl], loads it, and plays it.
class VideoPlayerScreen extends StatefulWidget {
  /// The URL of the video to be played.
  final String videoUrl;

  /// Creates a screen with a [videoUrl].
  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

/// Manages the state and controls for video playback in [VideoPlayerScreen].
class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  /// Controller that handles video loading and playback.
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with the provided URL.
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // When initialized, refresh the UI to show the video.
        setState(() {});
      });
  }

  @override
  void dispose() {
    // Dispose controller to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      body: Center(
        // If the controller is initialized, show the video. Otherwise show a loading spinner.
        child:
            _controller.value.isInitialized
                ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle playback between play/pause on button press.
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
