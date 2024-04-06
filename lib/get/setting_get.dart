// ignore_for_file: avoid_print

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/constants/config.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

import '../utils/background_service.dart';
import '../utils/datetime_helper.dart';

class SettingGetx extends GetxController {
  var isNotif = false.obs, isSchedule = false.obs;

  setNotif(bool val) async {
    await C.setBool(Appconfig.notif, val);
    getNotif();
  }

  getNotif() async {
    isNotif.value = await C.getBool(Appconfig.notif);
  }

  Future<bool> scheduledNews(bool value) async {
    isSchedule.value = value;
    if (isSchedule.value) {
      print('Scheduling News Activated');
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling News Canceled');
      return await AndroidAlarmManager.cancel(1);
    }
  }

  @override
  void onInit() {
    getNotif();
    super.onInit();
  }
}
