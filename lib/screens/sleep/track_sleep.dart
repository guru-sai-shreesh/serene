import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/model/colors.dart';
import 'package:serene/widget/custom_tab_indicator.dart';

class TrackSleep extends StatefulWidget {
  const TrackSleep({Key? key}) : super(key: key);

  @override
  State<TrackSleep> createState() => _TrackSleepState();
}

class _TrackSleepState extends State<TrackSleep> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          margin: EdgeInsets.all(20),
          color: AppColors.cardcolor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Start Sleep',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ))),
    );
  }
}
