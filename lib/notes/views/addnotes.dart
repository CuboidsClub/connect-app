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
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.share_outlined),
              onPressed: () {},
            ),
            Consumer<AddNotesViewModel>(
              builder: (context, data, child) => IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: data.index == null
                    ? null
                    : () async {
                        await context
                            .read<AddNotesViewModel>()
                            .deleteNotes(index!);
                        Navigator.pop(context);
                      },
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 12.h, left: 20.w, right: 20.w),
          children: [
            AddNotesTitle(notes == null ? null : notes!.title),
            AddNotesContent(notes == null ? null : notes!.content),
          ],
        ),
      ),
    );
  }
}

class AddNotesTitle extends StatelessWidget {
  const AddNotesTitle(this.title);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          minLines: 1,
          maxLines: 2,
          initialValue: title,
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
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}

class AddNotesContent extends StatelessWidget {
  const AddNotesContent(this.content);
  final String? content;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: content,
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
