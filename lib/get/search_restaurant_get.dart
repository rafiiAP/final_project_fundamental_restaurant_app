import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_model.dart';

import '../common/color.dart';
import '../data/constants/image.dart';
import '../widgets/main_widget.dart';

class SerachRestaurantGetx extends GetxController {
  ApiService apiService = ApiService();
  TextEditingController cSearch = TextEditingController();
  Rx<List<SearchModel>> vaSearch = Rx<List<SearchModel>>([]);
  var isLoading = false.obs;

  searchRestaurant({required String name}) {
    try {
      vaSearch.value.clear();
      isLoading.value = true;
      apiService.checkConnection().then((val) {
        if (val) {
          apiService.searchRestaurant(name: name).then((value) {
            if (value.error == false) {
              vaSearch.value = value.restaurants;
              isLoading.value = false;
            }
          });
        } else {
          isLoading.value = false;
          W.msgNoConnection(
            onPressed: () {
              Get.back();
              searchRestaurant(name: name);
            },
          );
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  onChange({required String value}) {
    searchRestaurant(name: value);
  }

  showMessage({required String name}) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imgNoInternet,
              width: 200,
              height: 200,
            ),
            W.textBody(
              cText: 'Opps,. koneksi internetmu tidak ada nih',
              fontSize: 20,
            ),
            W.paddingHeight16(),
            SizedBox(
              width: double.infinity,
              child: W.button(
                onPressed: () {
                  Get.back();
                  searchRestaurant(name: name);
                },
                child: W.textBody(
                  cText: 'Coba Lagi',
                  textColor: AppColorConfig.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColorConfig.white,
    );
  }

  // @override
  // void onClose() {
  //   print('--close');
  //   cSearch.dispose();
  //   vaSearch.value.clear();
  //   super.onClose();
  // }
}
