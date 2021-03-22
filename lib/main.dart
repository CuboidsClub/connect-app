import 'package:biher_noticeboard/utils/constants.dart';
import 'package:biher_noticeboard/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    NoticeBoard(),
  );
}

class NoticeBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        onGenerateRoute: onGenerateRoute,
        initialRoute: into,
      ),
    );
  }
}
