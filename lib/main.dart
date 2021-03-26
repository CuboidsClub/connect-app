import 'package:biher_noticeboard/home/views/home.dart';
import 'package:biher_noticeboard/into/into.dart';
import 'package:biher_noticeboard/theme.dart';
import 'package:biher_noticeboard/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'home/views/home.dart';
import 'models/notes.dart';
import 'sign_in/viewmodel/authviewModel.dart';
import 'sign_in/views/login_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotesAdapter());
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

    //To check the user as see the into screen or not
    Widget getProperView(AsyncSnapshot<List> snapshot) {
      if (snapshot.data![0].containsKey('intoShown')) {
        return snapshot.data![0].get('intoShown')
            ? ChangeNotifierProvider(
                create: (_) => UserRepository.instance(),
                child: Consumer(
                  builder: (context, UserRepository user, _) {
                    switch (user.status) {
                      case Status.Uninitialized:
                        return Container();
                      case Status.Unauthenticated:
                        return LoginPage();
                      case Status.Authenticated:
                        return HomePage();
                    }
                  },
                ),
              )
            : IntoScreenPage();
      } else {
        return IntoScreenPage();
      }
    }

    return FutureBuilder(
      future: Future.wait([
        Hive.openBox('general'),
        Hive.openBox('notes'),
        Hive.openBox('notification'),
        Hive.openBox('events'),
        Firebase.initializeApp(),
      ]),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ScreenUtilInit(
            builder: () => MaterialApp(
              theme: lightTheme,
              onGenerateRoute: onGenerateRoute,
              home: getProperView(snapshot),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
