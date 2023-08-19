import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reddit/providers/secrets_provider.dart';
import 'package:reddit/providers/token_manager_provider.dart';

class RedditProvider {
  final String apiUrl = SecretsProvider().apiUrl;
  final String oauthUrl = SecretsProvider().oauthUrl;

  Future<Map<String, dynamic>> fetchBest() async {
    final response = await http.get(Uri.parse('$oauthUrl/best'), headers: {
      "Authorization": "bearer ${await TokenManagerProvider.getToken()}",
      "User-Agent": "flutter:alessandro.sh"
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  Future<Map<String, dynamic>> fetchAbout(String subreddit) async {
    final response = await http.get(
        Uri.parse('https://www.reddit.com/r/$subreddit/about.json'),
        headers: {"User-Agent": "flutter:alessandro.sh"});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
