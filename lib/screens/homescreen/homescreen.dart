import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serene/model/colors.dart';
import 'package:serene/screens/dashboard/dashboard.dart';
import 'package:serene/screens/fitness/fitness.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:health/health.dart';
import 'package:serene/screens/profile/profile.dart';
import 'package:serene/screens/sleep/sleep.dart';
import 'package:serene/widget/custom_tab_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Widget _contentFetchingData() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //           padding: EdgeInsets.all(20),
  //           child: CircularProgressIndicator(
  //             strokeWidth: 10,
  //           )),
  //       Text('Fetching data...')
  //     ],
  //   );
  // }

  // Widget _contentDataReady() {
  //   return ListView.builder(
  //       itemCount: _healthDataList.length,
  //       itemBuilder: (_, index) {
  //         HealthDataPoint p = _healthDataList[index];
  //         if (p.value is AudiogramHealthValue) {
  //           return ListTile(
  //             title: Text("${p.typeString}: ${p.value}"),
  //             trailing: Text('${p.unitString}'),
  //             subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
  //           );
  //         }
  //         if (p.value is WorkoutHealthValue) {
  //           return ListTile(
  //             title: Text(
  //                 "${p.typeString}: ${(p.value as WorkoutHealthValue).totalEnergyBurned} ${(p.value as WorkoutHealthValue).totalEnergyBurnedUnit?.typeToString()}"),
  //             trailing: Text(
  //                 '${(p.value as WorkoutHealthValue).workoutActivityType.typeToString()}'),
  //             subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
  //           );
  //         }
  //         return ListTile(
  //           title: Text("${p.typeString}: ${p.value}"),
  //           trailing: Text('${p.unitString}'),
  //           subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
  //         );
  //       });
  // }

  // Widget _contentNoData() {
  //   return Text('No Data to show');
  // }

  // Widget _contentNotFetched() {
  //   return Column(
  //     children: [
  //       Text('Press the download button to fetch data.'),
  //       Text('Press the plus button to insert some random data.'),
  //       Text('Press the walking button to get total step count.'),
  //     ],
  //     mainAxisAlignment: MainAxisAlignment.center,
  //   );
  // }

  // Widget _authorizationNotGranted() {
  //   return Text('Authorization not given. '
  //       'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
  //       'For iOS check your permissions in Apple Health.');
  // }

  // Widget _dataAdded() {
  //   return Text('Data points inserted successfully!');
  // }

  // Widget _stepsFetched() {
  //   return Text('Total number of steps: $_nofSteps');
  // }

  // Widget _dataNotAdded() {
  //   return Text('Failed to add data');
  // }

  // Widget _content() {
  //   if (_state == AppState.DATA_READY)
  //     return _contentDataReady();
  //   else if (_state == AppState.NO_DATA)
  //     return _contentNoData();
  //   else if (_state == AppState.FETCHING_DATA)
  //     return _contentFetchingData();
  //   else if (_state == AppState.AUTH_NOT_GRANTED)
  //     return _authorizationNotGranted();
  //   else if (_state == AppState.DATA_ADDED)
  //     return _dataAdded();
  //   else if (_state == AppState.STEPS_READY)
  //     return _stepsFetched();
  //   else if (_state == AppState.DATA_NOT_ADDED) return _dataNotAdded();

  //   return _contentNotFetched();
  // }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [Dashboard(), Sleep(), Fitness(), Profile()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xFF0D47A1),
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Dashboard",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule),
                label: "Sleep",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Mindful",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Profile",
                backgroundColor: Colors.grey),
          ]),
      body: IndexedStack(
        children: screens,
        index: currentIndex,
      ),
    );
  }
  //   return MaterialApp(
  //     home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Health Example'),
  //           actions: <Widget>[
  //             IconButton(
  //               icon: Icon(Icons.file_download),
  //               onPressed: () {
  //                 fetchData();
  //               },
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 addData();
  //               },
  //               icon: Icon(Icons.add),
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 fetchStepData();
  //               },
  //               icon: Icon(Icons.nordic_walking),
  //             )
  //           ],
  //         ),
  //         body: Center(
  //           child: _content(),
  //         )),
  //   );
  // }
}
