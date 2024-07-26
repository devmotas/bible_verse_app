import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckInternetConnectionService {
  Future<bool> checkInternetConnection() async {
    try {
      if (!Platform.isAndroid && !Platform.isIOS) {
        return true;
      }
      final result = await InternetConnectionChecker().hasConnection;
      print(result);
      return result;
    } catch (e) {
      return false;
    }
  }
}
