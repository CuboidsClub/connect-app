import 'package:biher_noticeboard/classroom/views/classroom.dart';
import 'package:biher_noticeboard/events/views/events.dart';
import 'package:biher_noticeboard/notes/views/notes.dart';
import 'package:biher_noticeboard/noticeboard/views/noticeboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
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
    ClassRoomPage(),
    EventsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.all(16.w),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(LineariconsFree.file_empty),
            title: Text("Notes"),
          ),
          SalomonBottomBarItem(
            icon: Icon(LineariconsFree.envelope),
            title: Text("Announement"),
          ),
          SalomonBottomBarItem(
            icon: Icon(LineariconsFree.hourglass),
            title: Text("Classes"),
          ),
          SalomonBottomBarItem(
            icon: Icon(LineariconsFree.calendar_full),
            title: Text("Schedule"),
          ),
        ],
      ),
    );
  }
}
