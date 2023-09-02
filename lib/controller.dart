import 'package:shared_preferences/shared_preferences.dart';

class NotesController {
  List<String> notes = [];

  void addnotes(int index, String note) {
    notes.insert(index, note);
    saveNotes();
  }

  void updatenotes(int index, String note) {
    notes[index] = note;
    saveNotes();
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    saveNotes();
  }

  Future<void> saveNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("notes", notes);
  }

  Future<void> loadnotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    notes = prefs.getStringList("notes") ?? [];
  }
}
