/// A service class that interacts with the Pexels API to fetch photos and videos.
library;

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

/// Manages API calls to the Pexels service for photo and video searches.
class PexelsService {
  /// The API key retrieved from the `.env` file.
  final String apiKey = dotenv.env['PEXELS_API_KEY']!;

  /// Base URL endpoint for photo searches.
  final String _photoBaseUrl = 'https://api.pexels.com/v1/search';

  /// Base URL endpoint for video searches.
  final String _videoBaseUrl = 'https://api.pexels.com/videos/search';

  /// Searches for photos using the specified [query].
  ///
  /// You can optionally set the number of results per page with [perPage].
  /// Returns a list of photo data if the response is successful.
  /// Throws an [Exception] if the request fails.
  Future<List<dynamic>> searchPhotos(String query, {int perPage = 10}) async {
    final url = Uri.parse('$_photoBaseUrl?query=$query&per_page=$perPage');
    final response = await http.get(url, headers: {'Authorization': apiKey});

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['photos'] as List<dynamic>;
    } else {
      throw Exception('Failed to fetch photos');
    }
  }

  /// Searches for videos using the specified [query].
  ///
  /// You can optionally set the number of results per page with [perPage].
  /// Returns a list of video data if the response is successful.
  /// Throws an [Exception] if the request fails.
  Future<List<dynamic>> searchVideos(String query, {int perPage = 10}) async {
    final url = Uri.parse('$_videoBaseUrl?query=$query&per_page=$perPage');
    final response = await http.get(url, headers: {'Authorization': apiKey});

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['videos'] as List<dynamic>;
    } else {
      throw Exception('Failed to fetch videos');
    }
  }
}
