import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/ui/dashboard.dart';

final DatabaseHelper databaseHelper = DatabaseHelper();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  databaseHelper.db;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(),
        home: DashboardPage());
  }
}
