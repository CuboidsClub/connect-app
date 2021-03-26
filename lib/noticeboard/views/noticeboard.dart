import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoticeBoard'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
            child: Notice(),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.all(8.w),
      onTap: () {},
      leading: CircleAvatar(
        radius: 28.w,
      ),
      title: Text(
        'This the Title',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'This the body of the app.to check the message proper message received and showed to all clearly.',
      ),
    );
  }
}
