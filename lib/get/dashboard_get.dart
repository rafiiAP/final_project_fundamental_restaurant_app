import 'package:get/get.dart';
import 'package:restaurant_app/ui/favorite_page.dart';
import 'package:restaurant_app/ui/home.dart';
import 'package:restaurant_app/ui/setting_page.dart';

import '../utils/local_notif_helper.dart';

class DashboardGetx extends GetxController {
  final NotificationHelper notificationHelper = NotificationHelper();
  var nIndex = 0.obs;
  final List vaWidget = [
    HomePage(),
    FavoritePage(),
    SettingPage(),
  ];

  @override
  void onInit() {
    notificationHelper.configureSelectNotificationSubject();
    super.onInit();
  }

  @override
  void onClose() {
    selectNotificationSubject.close();
    super.onClose();
  }
}
