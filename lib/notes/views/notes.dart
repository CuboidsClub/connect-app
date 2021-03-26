import 'package:biher_noticeboard/models/notes.dart';
import 'package:biher_noticeboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
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
          child: Icon(FontAwesome5.plus),
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
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                addNotes,
                arguments: {'note': note, 'index': index},
              );
            },
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title!,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  Text(
                    note.content!,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
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
          FontAwesome5.plus_circle,
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
