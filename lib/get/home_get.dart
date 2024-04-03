import 'package:get/get.dart';
import 'package:restaurant_app/widgets/main_widget.dart';

import '../data/api/api_service.dart';
import '../data/model/restaurant_list_model.dart';

class RestaurantGetx extends GetxController {
  final ApiService apiService = ApiService();
  Rx<List<RestaurantListModel>> vaRestaurant =
      Rx<List<RestaurantListModel>>([]);
  var isLoading = false.obs;

  getListRestaurant() {
    isLoading.value = true;
    apiService.checkConnection().then((val) {
      try {
        if (val) {
          apiService.getListRestaurant().then((value) {
            if (value.message == 'success') {
              isLoading.value = false;
              vaRestaurant.value = value.restaurants;
            }
          });
        } else {
          isLoading.value = false;
          W.msgNoConnection(
            onPressed: () {
              Get.back();
              getListRestaurant();
            },
          );
        }
      } catch (e) {
        throw Exception(e);
      }
    });
  }

  @override
  void onInit() {
    getListRestaurant();
    super.onInit();
  }
}
