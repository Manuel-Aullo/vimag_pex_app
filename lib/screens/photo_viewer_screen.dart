import 'package:flutter/material.dart';

/// A screen that displays a photo in an interactive viewer.
class PhotoViewerScreen extends StatefulWidget {
  final String imageUrl;

  /// Creates a screen that displays a photo from an [imageUrl].
  const PhotoViewerScreen({super.key, required this.imageUrl});

  @override
  PhotoViewerScreenState createState() => PhotoViewerScreenState();
}

/// The state for [PhotoViewerScreen], managing the interactive viewer.
class PhotoViewerScreenState extends State<PhotoViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Viewer')),
      // InteractiveViewer provides zoom & pan gestures
      body: InteractiveViewer(
        minScale: 0.5, // Minimum zoom level
        maxScale: 4.0, // Maximum zoom level
        child: Center(
          child: Image.network(widget.imageUrl),
        ), // Display the image
      ),
    );
  }
}
