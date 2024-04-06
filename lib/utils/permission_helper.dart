import 'package:permission_handler/permission_handler.dart';

class MyPermission {
  static Future<void> init() async {
    await Permission.notification.onDeniedCallback(() {
      // Your code
    }).onGrantedCallback(() {
      // Your code
    }).onPermanentlyDeniedCallback(() {
      // Your code
    }).request();
    await Permission.scheduleExactAlarm.onDeniedCallback(() {
      // Your code
    }).onGrantedCallback(() {
      // Your code
    }).onPermanentlyDeniedCallback(() {
      // Your code
    }).request();
  }
}
