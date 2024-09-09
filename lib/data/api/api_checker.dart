import 'package:http/http.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      //clear all user data
    } else {}
  }
}
