import 'package:biher_noticeboard/classroom/views/classroom.dart';
import 'package:biher_noticeboard/events/views/events.dart';
import 'package:biher_noticeboard/menu/views/settings.dart';
import 'package:biher_noticeboard/notes/views/notes.dart';
import 'package:biher_noticeboard/noticeboard/views/noticeboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        child: SnakeNavigationBar.color(
          padding: EdgeInsets.all(10.w),
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.white,
          snakeViewColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.stickyNote),
              label: 'tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bullhorn),
              label: 'calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.restroom),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              label: 'microphone',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'search',
            )
          ],
        ),
      ),
    );
  }
}
