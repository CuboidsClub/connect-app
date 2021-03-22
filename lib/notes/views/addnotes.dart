import 'package:biher_noticeboard/models/notes.dart';
import 'package:biher_noticeboard/notes/viewModel/addnotes_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatelessWidget {
  final Notes? notes;
  final int? index;
  const AddNotes({this.notes, this.index});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddNotesViewModel(notes, index),
      builder: (context, child) => child!,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.share_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 12.h, left: 20.w, right: 20.w),
          children: [
            AddNotesTitle(),
            AddNotesContent(),
          ],
        ),
      ),
    );
  }
}

class AddNotesTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          minLines: 1,
          maxLines: 2,
          onChanged: (String title) =>
              context.read<AddNotesViewModel>().titleChanged(title),
          style: TextStyle(
            fontSize: 22.sp,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Title',
            hintStyle: TextStyle(
              fontSize: 22.sp,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6.h, bottom: 6.h),
          width: 1.sw,
          height: 0.0010.sh,
          color: Colors.black,
        ),
      ],
    );
  }
}

class AddNotesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 100,
      minLines: 1,
      onChanged: (String content) =>
          context.read<AddNotesViewModel>().contentChanged(content),
      style: TextStyle(
        fontSize: 15.sp,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Content',
        hintStyle: TextStyle(
          fontSize: 15.sp,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
