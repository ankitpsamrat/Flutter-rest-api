import 'package:flutter/material.dart';
import 'package:rest_api/models/note_for_list.dart';
import 'package:rest_api/screens/note_delete.dart';
import 'package:rest_api/screens/note_screen.dart';

class NoteListScreen extends StatelessWidget {
  // const NoteListScreen({super.key});

  final notes = [
    NoteForListing(
      noteId: '1',
      noteTitle: 'Note1',
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
    ),
    NoteForListing(
      noteId: '2',
      noteTitle: 'Note2',
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
    ),
    NoteForListing(
      noteId: '3',
      noteTitle: 'Note3',
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
    ),
  ];

  String formatedDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('My all Notes'),
      ),
      body: ListView.separated(
        itemCount: notes.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 0, color: Colors.grey);
        },
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(notes[index].noteId!),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete(),
              );
              return result;
            },
            onDismissed: (direction) {},
            child: ListTile(
              dense: true,
              title: Text(
                notes[index].noteTitle!,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(
                'Last eddited on ${formatedDate(notes[index].lastEditDateTime!)}',
                // style: TextStyle(
                //   color: Theme.of(context).primaryColor,
                // ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteScreen(
                      noteId: notes[index].noteId!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
