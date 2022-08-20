import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:serene/services/fit_sync_service.dart';

class FetchHealthData {
  Future<int?> fetchNoStep() async {
    int? steps;
    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        print("Caught exception in getTotalStepsInInterval: $error");
      }

      print('Total number of steps: $steps');
    } else {
      print("Authorization not granted - error in authorization");
      steps = null;
    }
    return steps;
  }

  Future<int?> fetchWNoStep() async {
    int? steps;
    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.weekday);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        print("Caught exception in getTotalStepsInInterval: $error");
      }

      print('Total number of steps: $steps');
    } else {
      print("Authorization not granted - error in authorization");
      steps = null;
    }
    return steps;
  }

  late List<HealthDataPoint> _healthDataList = [];

  /// Fetch data points from the health plugin and show them in the app.
  Future<List<HealthDataPoint>?> fetchWStepData() async {
    final types = [
      // HealthDataType.STEPS,
      // HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      // HealthDataType.BLOOD_GLUCOSE,
      // HealthDataType.WORKOUT,
      // HealthDataType.HEART_RATE
      // HealthDataType.STEPS,
      // HealthDataType.ACTIVE_ENERGY_BURNED
    ];

    // with coresponsing permissions
    final permissions = [
      HealthDataAccess.READ,
    ];

    // get data within the last 24 hours
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 365));
    // requesting access to the data types before reading them
    // note that strictly speaking, the [permissions] are not
    // needed, since we only want READ access.

    // If we are trying to read Step Count, Workout, Sleep or other data that requires
    // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
    // This requires a special request authorization call.
    //
    // The location permission is requested for Workouts using the Distance information.

    // if (requested) {
    try {
      // fetch health data
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);
      // save all the new data points (only the first 100)
      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (error) {
      print("Exception in getHealthDataFromTypes: $error");
    }

    // filter out duplicates
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);
    // print the results
    _healthDataList.forEach((x) => print(x));
    // } else {
    //   print("Authorization not granted");
    // }
    return _healthDataList;
  }
  // Future<List<HealthDataPoint>?> fetchWStepData() async {
  //   final types = [
  //     HealthDataType.HEIGHT,
  //   ];

  //   // with coresponsing permissions
  //   final permissions = [
  //     HealthDataAccess.READ,
  //   ];

  //   // get data within the last 24 hours
  //   final now = DateTime.now();
  //   final yesterday = now.subtract(Duration(days: 5));

  //   // if (requested) {
  //   try {
  //     // fetch health data
  //     List<HealthDataPoint> healthData =
  //         await health.getHealthDataFromTypes(yesterday, now, types);
  //     // save all the new data points (only the first 100)
  //     _healthDataList.addAll(
  //         (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
  //   } catch (error) {
  //     print("Exception in getHealthDataFromTypes: $error");
  //   }

  //   // filter out duplicates
  //   _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

  //   // print the results
  //   _healthDataList.forEach((x) => print(x));
  //   // } else {
  //   //   print("Authorization not granted");
  //   // }
  //   return _healthDataList;
  // }
}
