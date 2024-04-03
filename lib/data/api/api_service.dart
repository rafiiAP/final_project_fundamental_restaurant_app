import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_list_model.dart';
import 'package:restaurant_app/data/model/search_model.dart';

import '../model/restaurant_detail_model.dart';

String imageURL = 'https://restaurant-api.dicoding.dev/images/small/';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<ResponseListModel> getListRestaurant() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return responseListModelFromJson(response.body);
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<ResponseDetailModel> getDetailRestaurant({required String id}) async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl/detail/$id"))
          .timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        return responseDetailModelFromJson(response.body);
      } else {
        throw Exception('Failed to load top headlines');
      }
    } on TimeoutException {
      Get.snackbar('Time out', 'Time out');
      throw TimeoutException('Time Out');
    }
  }

  Future<ResponseSearchModel> searchRestaurant({required String name}) async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl/search?q=$name"))
          .timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        return responseSearchModelFromJson(response.body);
      } else {
        throw Exception('Failed to load top headlines');
      }
    } on TimeoutException {
      Get.snackbar('Time out', 'Time out');
      throw TimeoutException('Time Out');
    }
  }
}
