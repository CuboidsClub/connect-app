import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0.w),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              height: 0.12.sh,
              selectionColor: Colors.red,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
              },
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
