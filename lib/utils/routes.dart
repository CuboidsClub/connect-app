import 'package:biher_noticeboard/home/views/home.dart';
import 'package:biher_noticeboard/into/into.dart';
import 'package:biher_noticeboard/models/notes.dart';
import 'package:biher_noticeboard/notes/views/addnotes.dart';
import 'package:biher_noticeboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case into:
      return MaterialPageRoute(
        builder: (_) => IntoScreenPage(),
      );
    case addNotes:
      Notes? note;
      int? index;
      if (settings.arguments != null) {
        Map arguments = settings.arguments as Map;
        note = arguments['note'] as Notes;
        index = arguments['index'] as int;
      }
      return MaterialPageRoute(
        builder: (_) => AddNotes(
          notes: note,
          index: index,
        ),
      );
    case home:
      return MaterialPageRoute(
        builder: (_) => HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Center(
          child: Container(
            child: Text('Invalid route'),
          ),
        ),
      );
  }
}
