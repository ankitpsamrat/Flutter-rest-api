import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  const NoteDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure?'),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('No'),
        ),
      ],
    );
  }
}
