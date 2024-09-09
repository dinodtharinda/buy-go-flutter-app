// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'package:device_information/device_information.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

class Permissions {
  static PermissionHandlerPlatform get _handler =>
      PermissionHandlerPlatform.instance;
  static var apiLevel;

  static Future<bool> camaraPermissionRequest() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isPermanentlyDenied || status.isRestricted || status.isLimited) {
      print(
          ' ${status.isPermanentlyDenied} , ${status.isRestricted} , ${status.isLimited}');
      print("camera");
      throw Exception();
    }
    return status.isGranted;
  }

  static Future<bool> storagePermissionRequest() async {
    apiLevel = await DeviceInformation.apiLevel as int;
    PermissionStatus status = apiLevel > 30
        ? await Permission.manageExternalStorage.request()
        : await Permission.storage.request();

    if (status.isPermanentlyDenied || status.isRestricted || status.isLimited) {
      print(
          'storage ${status.isPermanentlyDenied} , ${status.isRestricted} , ${status.isLimited}');
      print("storage");
      throw Exception();
    }

    return status.isGranted;
  }

  static Future<bool> locationPermissionRequest() async {
    Map<Permission, PermissionStatus> status =
        await _handler.requestPermissions([
      Permission.location,
      Permission.locationAlways,
      Permission.locationAlways,
    ]);
    bool isGranted = true;
    status.forEach((key, status) {
      if (status.isDenied) {
        isGranted = false;
      }
      if (status.isPermanentlyDenied ||
          status.isRestricted ||
          status.isLimited) {
        print(
            'location ${status.isPermanentlyDenied} , ${status.isRestricted} , ${status.isLimited}');

        throw Exception();
      }
    });

    return isGranted;
  }

  static Future<bool> allPermissionRequest() async {
    try {
      return await camaraPermissionRequest() &&
          await storagePermissionRequest() &&
          await locationPermissionRequest();
    } catch (e) {
      _handler.openAppSettings();
      return false;
    }
  }
}
