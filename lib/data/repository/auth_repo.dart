// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../utils/constant/app_constants.dart';
import '../model/response/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_client.dart';

class AuthRepository with ChangeNotifier {
  final HttpService httpService;
  final SharedPreferences sharedPreferences;

  AuthRepository({
    required this.httpService,
    required this.sharedPreferences,
  });

  Future<ResponseModel> login(String phone, String password) async {
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    try {
      final response = await httpService.postData(
        uri: AppConstants.LOGIN_URI,
        body: {"mobile": phone, "password": password},
      );
      responseModel = response;
      if (response.isSuccess) {
        print("===============");
        final String token = response.data["id"].toString();
        _saveToken(token);
      }
    } catch (error) {
      _handleError('Login failed repo', error);
    }
    return responseModel;
  }

  Future<ResponseModel> signUp(String name, String email, String mobile,
      String password, String country, String gender) async {
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);

    try {
      final response = await httpService.postData(
        uri: AppConstants.SIGNUP_URI,
        body: {
          "name": name,
          "email": email,
          "mobile": mobile,
          "password": password,
          "country": country,
          "gender": gender,
        },
      );

      responseModel = response;
      if (response.isSuccess) {
        String id = response.data["id"].toString();
        responseModel.data = id;
      }
    } catch (error) {
      _handleError('Signup failed repo', error);
    }

    return responseModel;
  }

  void _saveToken(String token) {
    sharedPreferences.setString('id', token);
    httpService.updateHeaders(token);
  }

  bool isLogged() {
    final id = sharedPreferences.getString('id');
    return id != null && id != "";
  }

  void logOut() {
    sharedPreferences.setString('id', "");
  }

  void _handleError(String message, dynamic error) {
    debugPrint('$message: $error');
    // Handle errors as needed, e.g., show a snackbar or log to analytics
  }
}
