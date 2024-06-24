import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  Future<void> _fetchUser() async {
    const String apiUrl = 'https://randomuser.me/api/?results=20';

    final uri = Uri.parse(apiUrl);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];

          return ListTile(
            leading: Text(user['index'] ?? ''),
            title: Text(user['email'] ?? ''),
            // subtitle: Text(user['username']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUser,
        child: const Icon(Icons.person),
      ),
    );
  }
}
