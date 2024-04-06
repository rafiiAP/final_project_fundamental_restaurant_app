import 'package:get/get.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';

class FavoriteGet extends GetxController {
  var isLoading = false.obs;
  DatabaseHelper databaseHelper = DatabaseHelper();
  Rx<List<RestaurantListModel>> vaRestaurant =
      Rx<List<RestaurantListModel>>([]);

  getFavorite() async {
    isLoading.value = true;
    await databaseHelper.getAllRestaurants().then((value) {
      vaRestaurant.value =
          value.map((x) => RestaurantListModel.fromJson(x)).toList();
      isLoading.value = false;
    });
  }

  removeFavorite(RestaurantListModel restaurant) async {
    //mohon sarannya kalau ada cara yang lebih efisien lagi
    try {
      isLoading.value = true;
      await databaseHelper.deleteRestaurantById(restaurant.id);
      await databaseHelper.deleteFoodByRestaurantId(restaurant.id);
      await databaseHelper.deleteDrinkByRestaurantId(restaurant.id);
      getFavorite();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }
}
