import 'package:get/get.dart';
import 'package:restaurant_app/ui/favorite_page.dart';
import 'package:restaurant_app/ui/home.dart';

class DashboardGetx extends GetxController {
  var nIndex = 0.obs;
  final List vaWidget = [
    HomePage(),
    FavoritePage(),
  ];
}
