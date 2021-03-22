import 'package:biher_noticeboard/models/notes.dart';
import 'package:biher_noticeboard/utils/constants.dart';
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
          onPressed: () {
            Navigator.pushNamed(context, addNotes);
          },
          child: Icon(FontAwesomeIcons.plus),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('notes').listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return NoNotesFound();
          } else {
            return NotesFound();
          }
        },
      ),
    );
  }
}

class NotesFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Box notes = Hive.box('notes');
    return GridView.builder(
      padding: EdgeInsets.all(20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 180.h,
      ),
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        Notes note = notes.getAt(index);
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          child: Column(
            children: [
              Text(note.title!),
              Text(note.content!),
            ],
          ),
        );
      },
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
