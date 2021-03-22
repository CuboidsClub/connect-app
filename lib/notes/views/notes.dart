import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(5.w),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: Icon(FontAwesomeIcons.plus),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('notes').listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return NoNotesFound();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class NoNotesFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            noNotes(),
            SizedBox(
              height: 30.h,
            ),
            addNotesText(),
          ],
        ),
      ),
    );
  }

  Row addNotesText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Press',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Icon(
          FontAwesomeIcons.plusCircle,
          color: Colors.red,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          'to add notes to your phone.',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  SvgPicture noNotes() {
    return SvgPicture.asset(
      'assets/notes/addnotes.svg',
      height: 0.32.sh,
    );
  }
}
