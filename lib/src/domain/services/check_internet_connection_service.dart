import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckInternetConnectionService {
  Future<bool> checkInternetConnection() async {
    try {
      if (!Platform.isAndroid && !Platform.isIOS) {
        return true;
      }
      final internetConnectionChecker =
          await InternetConnectionChecker.createInstance();
      final result = await internetConnectionChecker.hasConnection;
      print(result);
      return result;
    } catch (e) {
      print('Erro ao verificar conexão com a internet: $e');
      return false;
    }
  }
}
