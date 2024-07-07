import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi {
  //

  static Future<List<dynamic>> fetchUser() async {
    const String apiUrl = 'https://randomuser.me/api/?results=30';

    try {
      final uri = Uri.parse(apiUrl);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        return json['results'] as List<dynamic>;
      } else {
        debugPrint('Failed to load users');
        return [];
      }
    } catch (e) {
      debugPrint('Unable to fetch users: $e');
      return [];
    }
  }
}
