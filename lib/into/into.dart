import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntoScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroductionScreen(
        globalBackgroundColor: Color(0xfff8f5f1),
        pages: [
          notesTaking(),
          getNotification(),
          getUpdates(),
          seeEvents(),
        ],
        showNextButton: true,
        showSkipButton: true,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.grey[900]!,
        ),
        next: Icon(
          FontAwesomeIcons.arrowRight,
          color: Colors.grey[900],
        ),
        skip: Icon(
          FontAwesomeIcons.times,
          color: Colors.grey[900],
        ),
        done: Icon(
          FontAwesomeIcons.check,
          color: Colors.grey[900],
        ),
        onDone: () {
          // When done button is press
        },
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
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
        color: Colors.grey[900],
      ),
      bodyTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
        fontSize: 18.sp,
      ),
    );
  }
}
