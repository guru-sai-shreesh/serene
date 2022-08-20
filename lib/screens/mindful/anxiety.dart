import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/model/colors.dart';

class Anxiety extends StatefulWidget {
  const Anxiety({Key? key}) : super(key: key);

  @override
  State<Anxiety> createState() => _AnxietyState();
}

class _AnxietyState extends State<Anxiety> {
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
                  'Reduce Anxiety',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ))),
    );
  }
}
