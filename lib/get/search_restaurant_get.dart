import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_model.dart';

class SerachRestaurantGetx extends GetxController {
  ApiService apiService = ApiService();
  TextEditingController cSearch = TextEditingController();
  Rx<List<SearchModel>> vaSearch = Rx<List<SearchModel>>([]);
  var isLoading = false.obs;

  searchRestaurant({required String name}) {
    vaSearch.value.clear();
    isLoading.value = true;
    apiService.searchRestaurant(name: name).then((value) {
      if (value.error == false) {
        vaSearch.value = value.restaurants;
        isLoading.value = false;
      }
    });
  }

  onChange({required String value}) {
    searchRestaurant(name: value);
  }
}
