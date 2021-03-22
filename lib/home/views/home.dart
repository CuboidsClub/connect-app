import 'package:biher_noticeboard/events/views/events.dart';
import 'package:biher_noticeboard/menu/views/settings.dart';
import 'package:biher_noticeboard/notes/views/notes.dart';
import 'package:biher_noticeboard/noticeboard/views/noticeboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    NotesPage(),
    NoticeBoardPage(),
    EventsPage(),
    MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.only(
          bottom: 15.h,
          top: 15.h,
          left: 20.w,
          right: 20.w,
        ),
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          //Notes
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.stickyNote),
            title: Text("Notes"),
          ),

          //Notification
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.envelope),
            title: Text("Notification"),
          ),

          //Events
          SalomonBottomBarItem(
            icon: Icon(Icons.event),
            title: Text("Events"),
          ),

          //Menu
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.bars),
            title: Text("Menu"),
          ),
        ],
      ),
    );
  }
}
