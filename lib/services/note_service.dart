import 'package:rest_api/models/note_for_list.dart';

class NoteService {
  //

  List<NoteForListing> getNoteList() {
    return [
      NoteForListing(
        noteId: '1',
        noteTitle: 'Note1',
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: '2',
        noteTitle: 'Note2',
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
      ),
      NoteForListing(
        noteId: '3',
        noteTitle: 'Note3',
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
      ),
    ];
  }
}
