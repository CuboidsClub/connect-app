import 'package:biher_noticeboard/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntoScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroductionScreen(
        pages: [
          notesTaking(),
          getNotification(),
          getUpdates(),
          seeEvents(),
        ],
        showNextButton: true,
        showSkipButton: true,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.red,
        ),
        next: Icon(
          FontAwesome.right,
          color: Colors.red,
        ),
        skip: Icon(
          FontAwesome.safari,
          color: Colors.red,
        ),
        done: Icon(
          FontAwesome.check,
          color: Colors.red,
        ),
        onSkip: () {
          navigateTohome(context);
        },
        onDone: () {
          navigateTohome(context);
        },
      ),
    );
  }

  navigateTohome(context) async {
    await Hive.box('general').put('intoShown', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  PageViewModel seeEvents() {
    return PageViewModel(
      title: "See Events",
      body:
          "Here students and teachers of bharat university can easily see all events of the collage planned for the year.",
      image: Padding(
        padding: EdgeInsets.all(25.w),
        child: Center(
          child: SvgPicture.asset('assets/into/events.svg'),
        ),
      ),
      decoration: intoDecoration(),
    );
  }

  PageViewModel getUpdates() {
    return PageViewModel(
      title: "Get Updates",
      body:
          "Here students and teachers of bharat university can easily get lastest updates from management.",
      image: Padding(
        padding: EdgeInsets.all(25.w),
        child: Center(
          child: SvgPicture.asset('assets/into/updates.svg'),
        ),
      ),
      decoration: intoDecoration(),
    );
  }

  PageViewModel getNotification() {
    return PageViewModel(
      title: "Get Notification",
      body:
          "Here students and teachers of bharat university can easily receive important notification from management directly without any delay.",
      image: Padding(
        padding: EdgeInsets.all(25.w),
        child: Center(
          child: SvgPicture.asset('assets/into/notification.svg'),
        ),
      ),
      decoration: intoDecoration(),
    );
  }

  PageViewModel notesTaking() {
    return PageViewModel(
      title: "Notes Taking",
      body:
          "Here students and teachers of bharat university can easily take notes for their subject at a ease.",
      image: Padding(
        padding: EdgeInsets.all(18.w),
        child: Center(
          child: SvgPicture.asset('assets/into/notetaking.svg'),
        ),
      ),
      decoration: intoDecoration(),
    );
  }

  PageDecoration intoDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w900,
        color: Colors.red,
      ),
      bodyTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
        fontSize: 18.sp,
      ),
    );
  }
}
