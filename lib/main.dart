import 'package:biher_noticeboard/theme.dart';
import 'package:biher_noticeboard/utils/constants.dart';
import 'package:biher_noticeboard/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes');
  runApp(
    NoticeBoard(),
  );
}

class NoticeBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      builder: () => MaterialApp(
        theme: lightTheme,
        onGenerateRoute: onGenerateRoute,
        initialRoute: into,
      ),
    );
  }
}
