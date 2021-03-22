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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.only(
          bottom: 15.h,
          left: 20.w,
          right: 20.w,
        ),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.stickyNote),
            title: Text("Notes"),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.envelope),
            title: Text("Notification"),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.event),
            title: Text("Events"),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.bars),
            title: Text("Menu"),
          ),
        ],
      ),
    );
  }
}
