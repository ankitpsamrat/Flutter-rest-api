import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/screens/note_list_screen.dart';
import 'package:rest_api/services/note_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NoteService());
}

void main() {
  setupLocator();
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
