import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/model/colors.dart';

class Meditation extends StatefulWidget {
  const Meditation({Key? key}) : super(key: key);

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
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
                  'Start Meditation',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ))),
    );
  }
}
