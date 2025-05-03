import 'package:flutter/material.dart';
import 'package:rest_api/basicMethod1.dart/basic_method1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api',
      home: BasicMethod1(),
    );
  }
}
