import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/get/setting_get.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final SettingGetx ctrl = Get.put(SettingGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
                title: const Text('Notif'),
                trailing: Obx(
                  () => Switch.adaptive(
                    value: ctrl.isNotif.value,
                    onChanged: (value) async {
                      ctrl.setNotif(value);
                      ctrl.scheduledNews(value);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
