import 'dart:math';
import 'dart:ui';
import 'dart:isolate';

import 'package:restaurant_app/data/model/restaurant_list_model.dart';

import '../data/api/api_service.dart';
import '../main.dart';
import 'local_notif_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    // ignore: avoid_print
    print('--Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper();
    ResponseListModel result = await ApiService().getListRestaurant();
    List<RestaurantListModel> vaRestaurant = result.restaurants;
    RestaurantListModel restaurant;
    var randomIndex = Random().nextInt(vaRestaurant.length);
    restaurant = vaRestaurant[randomIndex];

    await notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      restaurant,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
