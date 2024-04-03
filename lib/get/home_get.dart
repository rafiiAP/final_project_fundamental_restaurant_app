import 'package:get/get.dart';

import '../data/api/api_service.dart';
import '../data/model/restaurant_list_model.dart';

class RestaurantGetx extends GetxController {
  final ApiService apiService = ApiService();
  Rx<List<RestaurantListModel>> vaRestaurant =
      Rx<List<RestaurantListModel>>([]);
  var isLoading = false.obs;

  getListRestaurant() {
    try {
      isLoading.value = true;
      apiService.getListRestaurant().then((value) {
        if (value.message == 'success') {
          isLoading.value = false;
          vaRestaurant.value = value.restaurants;
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    getListRestaurant();
    super.onInit();
  }

  // Future<dynamic> getDetailRestaurant({required String id}) async {
  //   try {
  //     _state = ResultState.loading;
  //     notifyListeners();
  //     final restaurant = await apiService.getDetailRestaurant(id: id);
  //     if (restaurant.message != 'success') {
  //       _state = ResultState.noData;
  //       notifyListeners();
  //       return _message = 'Empty Data';
  //     } else {
  //       _state = ResultState.hasData;
  //       notifyListeners();
  //       return _restaurantDetailModel = restaurant;
  //     }
  //   } catch (e) {
  //     _state = ResultState.error;
  //     notifyListeners();
  //     return _message = 'Error --> $e';
  //   }
  // }
}
