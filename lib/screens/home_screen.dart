import 'package:flutter/material.dart';
import '../services/pexels_service.dart';
import 'photos_screen.dart';
import 'videos_screen.dart';

/// The main widget for the home screen, providing a search interface and tab navigation.
class HomeScreen extends StatefulWidget {
  /// Constructs a [HomeScreen] instance.
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// State class for [HomeScreen], handling search query changes and tab views.
class _HomeScreenState extends State<HomeScreen> {
  /// Controller for managing the text input (search query).
  final TextEditingController _searchController = TextEditingController();

  /// Service for interacting with the Pexels API.
  final PexelsService _pexelsService = PexelsService();

  /// The current search keyword used to fetch images and videos.
  String currentQuery = 'nature';

  /// Updates the [currentQuery] based on user input and triggers a rebuild.
  void _onSearch() {
    final String query = _searchController.text.trim();
    if (query.length > 2) {
      setState(() {
        currentQuery = query;
      });
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Search term must be longer than 2 characters.'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
            onSubmitted: (_) => _onSearch(),
          ),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.search), onPressed: _onSearch),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              /// Displays a tab for searching photos with an icon and label.
              Tab(icon: Icon(Icons.photo, size: 32), text: 'Photos'),

              /// Displays a tab for searching videos with an icon and label.
              Tab(icon: Icon(Icons.videocam, size: 32), text: 'Videos'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            /// Displays photo results from the Pexels API based on [currentQuery].
            PhotosScreen(query: currentQuery, pexelsService: _pexelsService),

            /// Displays video results from the Pexels API based on [currentQuery].
            VideosScreen(query: currentQuery, pexelsService: _pexelsService),
          ],
        ),
      ),
    );
  }
}
