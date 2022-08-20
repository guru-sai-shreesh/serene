import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/model/colors.dart';
import 'package:serene/screens/auth_screens/login_screen.dart';

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
              expandedHeight: 110,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                expandedTitleScale: 1.3,
                titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                title: Text("Profile"),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 30, right: 15),
                    child: Text(
                      "ACTIVITY",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    }),
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: AppColors.cardcolor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 40,
                        child: Center(child: Text("Logout")),
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
