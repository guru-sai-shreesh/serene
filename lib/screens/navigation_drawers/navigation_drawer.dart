import 'package:flutter/material.dart';
import 'package:serene/screens/auth_screens/login_screen.dart';
import 'package:serene/screens/homescreen/homescreen.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.cyan[900],
              foregroundImage: AssetImage('assets/images/profile.jpg'),
              child: Text("G"),
            ),
            accountName: Text("Tirumalla Guru sai shreeesh"),
            accountEmail: Text("guru.sai.shreesh@gmail.com"),
          ),
          ListTile(
            title: Text("Dashboard"),
            leading: Icon(Icons.dashboard_customize_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/homescreen"),
                  builder: (context) => HomeScreen(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
