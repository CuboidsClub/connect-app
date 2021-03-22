import 'package:biher_noticeboard/models/notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNotesViewModel extends ChangeNotifier {
  AddNotesViewModel(Notes? notes, this.index)
      : this.notes = notes ??
            Notes(
              id: DateTime.now().toLocal().microsecondsSinceEpoch.toString(),
              title: '',
              content: '',
              createdDate: DateTime.now().toLocal().toString(),
              lastEditedDate: DateTime.now().toLocal().toString(),
            ),
        super();
  Notes notes;
  int? index;
  Box box = Hive.box('notes');

  void deleteNotes() {}

  Future<void> titleChanged(String title) async {
    notes = notes.copyWith(
      title: title,
      lastEditedDate: DateTime.now().toLocal().toString(),
    );
    if (notes.title != '') {
      await updateBox();
    }
  }

  Future<void> updateBox() async {
    if (index == null) {
      index = await box.add(notes);
    } else {
      await box.putAt(index!, notes);
    }
    notifyListeners();
  }

  Future<void> contentChanged(String content) async {
    notes = notes.copyWith(
      content: content,
      lastEditedDate: DateTime.now().toLocal().toString(),
    );
    if (notes.title != '') {
      await updateBox();
    }
  }
}
