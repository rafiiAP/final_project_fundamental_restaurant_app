import 'package:get/get.dart';

import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/widgets/main_widget.dart';

class DetailGetx extends GetxController {
  String id;
  DetailGetx({required this.id});
  ApiService apiService = ApiService();

  var restaurantDetail = RestaurantDetailModel().obs;
  var isLoading = false.obs;

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

  @override
  void onInit() {
    getDetailRestaurant(id: id);
    super.onInit();
  }
}
