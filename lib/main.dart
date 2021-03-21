import 'package:biher_noticeboard/into/into.dart';
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
    return MaterialApp(
      home: ScreenUtilInit(
        allowFontScaling: false,
        builder: () => IntoScreenPage(),
      ),
    );
  }
}
