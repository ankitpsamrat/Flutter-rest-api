import 'package:flutter/material.dart';
import 'package:rest_api/screens/note_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Crud Operation',
      home: NoteListScreen(),
    );
  }
}
