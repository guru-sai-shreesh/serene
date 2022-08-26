import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/screens/auth_screens/googleOauth.dart';
import 'package:serene/screens/auth_screens/login_buttons.dart';
import 'package:serene/screens/homescreen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<bool> isPrefLogged() async {
//   final prefs = await SharedPreferences.getInstance();
//   final bool? loggedin = prefs.getBool('loggedin');
//   if (loggedin == null) {
//     return false;
//   } else if (loggedin == false) {
//     return false;
//   } else {
//     return true;
//   }
// }

// Future loginPref() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('loggedin', true);
//   print(true);
// }

// Future logoutPref() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('loggedin', false);
//   print(false);
// }

// void main() async {
//   runApp(const MyApp());
// }

// bool isLogedIn() {
//   bool logged = true;
//   return logged;
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider.value(
//             value: Auth(),
//           ),
//         ],
//         child: Consumer<Auth>(
//             builder: (ctx, auth, _) => MaterialApp(
//                 theme: ThemeData(
//                   primarySwatch: Colors.cyan,
//                   primaryColor: Colors.grey[50],
//                   // scaffoldBackgroundColor: Colors.cyan[100],
//                 ),
//                 home: auth.isAuth ? MyRegister() : AuthScreen()
//                 // home: WebViewGoogle("Google"),
//                 )));

//     // return MaterialApp(
//     //     theme: ThemeData(
//     //       primarySwatch: Colors.cyan,
//     //       primaryColor: Colors.grey[50],
//     //       // scaffoldBackgroundColor: Colors.cyan[100],
//     //     ),
//     //     home: AuthScreen());
//     // home: isLogedIn() ? LoginScreen() : HomeScreen());
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AWS Cognito Google Facebook signin',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.grey[50],
        // scaffoldBackgroundColor: Colors.cyan[100],
      ),
      home:
          // MyHomePage(title: 'AWS Cognito Google Facebook signin'),
          // snapshot.data
          //     ? HomeScreen():
          MyHomePage(title: 'AWS Cognito Google Facebook signin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String idendity_provider;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                        padding: EdgeInsets.only(
                            left: 25, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFF1976D2),
                            // border: Border.all(
                            //   width: 2,
                            //   color: Colors.black,
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SERENE",
                                  style: GoogleFonts.openSans(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Total Health Tracking",
                                  style: GoogleFonts.openSans(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    // color: Color(0xFF42A5F5),
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // Image.asset(
                            //   "assets/images/clg_logo.png",
                            //   height: 80,
                            //   width: 80,
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Devoloped By ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            const Text(
                              'Team Enigmatic',
                              style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 60),
                      child: Wrap(
                        runSpacing: 20,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: GoogleButton(onGoogleSignIn)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void onGoogleSignIn() async {
    idendity_provider = "Google";
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewGoogle(idendity_provider)),
    );
  }
}
