import 'package:flutter/cupertino.dart';

import '../models/note_model.dart';
import 'note_database.dart';

class NoteData with ChangeNotifier {
  List<Note> notes = [];
  NoteDatabase noteDatabase = NoteDatabase();

  void getNotes() {
    noteDatabase.getFullNote().then((value) {
      notes = value;
      notifyListeners();
    });
  }

  void addToNotes(String title, String content) {
    noteDatabase.addToBox(Note(title: title, content: content));
    getNotes();
  }

  void removeFromNotes({int index}) {
    noteDatabase.deleteFromBox(index);
    getNotes();
  }

  void updateNote({int index, String newTitle, String newContent}) {
     noteDatabase
        .updateNote(index, Note(title: newTitle, content: newContent));
    getNotes();
  }
}
