import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/models/note_for_list.dart';
import 'package:rest_api/screens/note_delete.dart';
import 'package:rest_api/screens/note_screen.dart';
import 'package:rest_api/services/note_service.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  //

  NoteService get service => GetIt.I<NoteService>();
  List<NoteForListing> notes = [];

  @override
  void initState() {
    super.initState();
    notes = service.getNoteList();
  }

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
                'Last eddited on ${formatedDate(notes[index].latestEditDateTime!)}',
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
