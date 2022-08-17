import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/model/colors.dart';
import 'package:serene/services/fetch_health_data.dart';
import 'package:serene/widget/circular_progress_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? steps;
  int? Wsteps;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _fetchData() async {
    FetchHealthData().fetchWStepData();
    Wsteps = await FetchHealthData().fetchWNoStep();
    steps = await FetchHealthData().fetchNoStep();
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
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
                title: Text("Dashboard"),
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
                  Container(
                    height: 190,
                    width: 190,
                    decoration: BoxDecoration(
                        color: AppColors.badgecolor,
                        borderRadius: BorderRadius.circular(25)),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: RadialProgress(
                                height: 20.0,
                                width: 20.0,
                                progress:
                                    1 - (steps ?? 0).toDouble() / (1000 / 7)),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                  Card(
                    margin: EdgeInsets.all(10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "STEPS COUNT",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  "Show All",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            width: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: ((Wsteps ?? 0).toDouble()) / 1000,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                                backgroundColor: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 0, right: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: Wsteps.toString(),
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: ' of 1000 Steps',
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 0, right: 15),
                                    child: Text(
                                      'Last 7 days',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Icon(
                                  Icons.run_circle,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Calories Burned",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Just Now",
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        color: Colors.white60,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 15, top: 2, right: 15),
                                        child: RichText(
                                          text: TextSpan(
                                            style: GoogleFonts.openSans(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '284 ',
                                                style: GoogleFonts.openSans(
                                                    fontSize: 34,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              TextSpan(
                                                text: 'Cal',
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        'Today',
                                        style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: Text(
                      "HEART",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "HEART RATE",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  "Just Now",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 2, right: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '65 ',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: 'BPM',
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 0, right: 15),
                                    child: Text(
                                      'NORMAL',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "BLOOD PREASURE",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  "Just Now",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 2, right: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '120/80 ',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: '',
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 0, right: 15),
                                    child: Text(
                                      'NORMAL',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 30),
                              //   child: Icon(
                              //     Icons.favorite,
                              //     color: Colors.white,
                              //     size: 40,
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: Text(
                      "BODY",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "BMI",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  "Just Now",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 2, right: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '21.7',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: '',
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 0, right: 15),
                                    child: Text(
                                      'NORMAL',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 30),
                              //   child: Icon(
                              //     Icons.favorite,
                              //     color: Colors.white,
                              //     size: 40,
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "HEIGHT",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  "Just Now",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 2, right: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '6 ',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: 'ft',
                                            ),
                                            TextSpan(
                                              text: ',1 ',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: 'in',
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    color: AppColors.cardcolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Weight",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  "Just Now",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 2, right: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '74.1 ',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 34,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: 'kg',
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
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
