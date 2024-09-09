// ignore_for_file: constant_identifier_names

import 'images.dart';
import 'language.dart';


class AppConstants {
  static const String BASE_URL = 'http://10.0.2.2:5000';
  static const String LOGIN_URI = "/api/v1/auth/signin";
  static const String SIGNUP_URI = "/api/v1/users/auth/signup";
  static const String VERIFY_URI = "/api/v1/users/verify";
  static const String QUESTIONER_URI = "/api/v1/users/questioner";
  static const String ALL_POST_URI = "/api/v1/posts";
  static const String GET_USER_ID = "/api/v1/users";
  static const String CREATE_POST = "/api/v1/posts";




  static const String LANGUAGE_CODE = 'flutter_design_app_language_code';
  static const String ZONE_TOPIC = 'zone_topic';




//Shared Key
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String TOKEN = 'token';
//Languages
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
  ];
}


  // http: ^1.1.2
  // shared_preferences: ^2.2.2
  // cross_file: ^0.3.3+8
  // cached_network_image: ^3.3.0
  // google_maps_flutter: ^2.5.0
  // google_maps_flutter_platform_interface: ^2.4.1
  // carousel_slider: ^4.2.1
  // intl: ^0.19.0
  // provider: ^6.1.1
  // mockito: ^5.4.4