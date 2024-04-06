import 'package:get/get.dart';

import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/widgets/main_widget.dart';

import '../data/db/database_helper.dart';

class DetailGetx extends GetxController {
  String id;
  DetailGetx({required this.id});

  ApiService apiService = ApiService();

  var restaurantDetail = RestaurantDetailModel().obs;
  var isLoading = false.obs, isFavorite = false.obs;
  final DatabaseHelper databaseHelper = DatabaseHelper();

  getDetailRestaurant({String? id = ''}) {
    isLoading.value = true;
    apiService.checkConnection().then((val) {
      if (val) {
        apiService.getDetailRestaurant(id: id!).then(
          (value) {
            restaurantDetail.value = value.restaurant;
            isLoading.value = false;
          },
        );
      } else {
        W.msgNoConnection(
          onPressed: () {
            Get.back();
            getDetailRestaurant(id: id);
          },
        );
      }
    });
  }

  favorite(String restaurantId) async {
    final favoriteRestaurant =
        await databaseHelper.getRestaurantById(restaurantId);
    isFavorite.value = favoriteRestaurant.isNotEmpty;
  }

  removeFavorite() async {
    //mohon sarannya kalau ada cara yang lebih efisien lagi
    try {
      await databaseHelper.deleteRestaurantById(restaurantDetail.value.id!);
      await databaseHelper.deleteFoodByRestaurantId(restaurantDetail.value.id!);
      await databaseHelper
          .deleteDrinkByRestaurantId(restaurantDetail.value.id!);
      favorite(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  addFavorite() async {
    //mohon sarannya kalau ada cara yang lebih efisien lagi

    try {
      await databaseHelper.insertRestaurant(restaurantDetail.value);
      for (Drink food in restaurantDetail.value.menus!.foods) {
        await databaseHelper.insertFood(food, restaurantDetail.value.id!);
      }
      for (Drink drink in restaurantDetail.value.menus!.drinks) {
        await databaseHelper.insertDrink(drink, restaurantDetail.value.id!);
      }

      favorite(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    getDetailRestaurant(id: id);

    super.onInit();
  }

  @override
  void onReady() {
    favorite(id);
    super.onReady();
  }
}
