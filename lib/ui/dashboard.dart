import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/get/dashboard_get.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final DashboardGetx ctrl = Get.put(DashboardGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ctrl.vaWidget[ctrl.nIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: ctrl.nIndex.value,
          onTap: (value) {
            ctrl.nIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Setting',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
