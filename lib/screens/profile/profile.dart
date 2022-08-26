import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/main.dart';
import 'package:serene/model/colors.dart';
import 'package:serene/screens/auth_screens/fit_sync.dart';
import 'package:serene/screens/auth_screens/googleOauth.dart';
import 'package:serene/screens/auth_screens/login_screen.dart';
import 'package:serene/screens/dashboard/dashboard.dart';
import 'package:serene/services/fit_sync_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              expandedHeight: 70,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                expandedTitleScale: 1.3,
                titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                title: Text("Profile"),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  GestureDetector(
                    onTap: (() async {
                      // await logoutPref();
                      count = 0;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                title: 'login',
                              )));
                    }),
                    child: Card(
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                      color: AppColors.cardcolor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 40,
                        child: Center(
                          child: Text("Logout",
                              style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
