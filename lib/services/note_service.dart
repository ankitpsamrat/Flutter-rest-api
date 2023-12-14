import 'dart:convert';

import 'package:rest_api/models/api_response.dart';
import 'package:rest_api/models/note_for_list.dart';
import 'package:http/http.dart' as http;

class NoteService {
  //
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<ApiResponse<List<NoteForListing>>> getNotesList() {
    return http.get(('$API/notes') as Uri, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteId: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return ApiResponse<List<NoteForListing>>(data: notes);
      }
      return ApiResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => ApiResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
