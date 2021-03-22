import 'package:biher_noticeboard/home/views/home.dart';
import 'package:biher_noticeboard/into/into.dart';
import 'package:biher_noticeboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> onGenerateRoute(RouteSettings? settings) {
  switch (settings!.name) {
    case into:
      return MaterialPageRoute(
        builder: (_) => IntoScreenPage(),
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
