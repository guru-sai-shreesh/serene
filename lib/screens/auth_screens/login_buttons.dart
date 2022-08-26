import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton(this.onPressed);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ))),
      icon: SvgPicture.asset('assets/images/google.svg'),
      onPressed: this.onPressed,
      label: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Sign in with Google',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
