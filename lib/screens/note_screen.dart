import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  final String? noteId;

  const NoteScreen({super.key, this.noteId});

  bool get isEditing => noteId != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(isEditing ? 'Edit Notes' : 'Create note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Note title',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Note content',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  /// update note in api
                } else {
                  /// create note in api
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
