import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/model/search_model.dart';
import 'package:restaurant_app/get/detail_restaurant_get.dart';
import 'package:restaurant_app/get/search_restaurant_get.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/widgets/main_widget.dart';

import '../data/api/api_service.dart';
import '../data/model/restaurant_list_model.dart';

class SerachRestaurantPage extends StatelessWidget {
  SerachRestaurantPage({super.key});

  final SerachRestaurantGetx ctrl = Get.put(SerachRestaurantGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: W.textBody(cText: 'Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            W.input(
              controller: ctrl.cSearch,
              filled: false,
              hintText: 'Restaurant',
              onChanged: (value) {
                ctrl.onChange(value: value);
              },
            ),
            W.paddingHeight16(),
            Obx(
              () => ctrl.isLoading.value
                  ? wCircularProgress()
                  : ctrl.vaSearch.value.isEmpty
                      ? wDataNotFound()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: ctrl.vaSearch.value.length,
                            itemBuilder: (context, index) {
                              SearchModel restaurant =
                                  ctrl.vaSearch.value[index];
                              return InkWell(
                                onTap: () {
                                  // Get.put(
                                  //   DetailGetx(id: restaurant.id),
                                  // );
                                  Get.to(
                                      DetailRestaurantPage(id: restaurant.id));
                                },
                                child: cardList(restaurant),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Transform wCircularProgress() {
    return Transform.translate(
      offset: Offset(0, Get.mediaQuery.size.height * 0.3),
      child: const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Transform wDataNotFound() {
    return Transform.translate(
        offset: Offset(0, Get.mediaQuery.size.height * 0.3),
        child: Container(
          child: W.textBody(
            cText: 'Data not found',
            fontSize: 25,
          ),
        ));
  }

  Padding cardList(SearchModel restaurants) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageURL + restaurants.pictureId,
              fit: BoxFit.cover,
              height: Get.mediaQuery.size.height * 0.07,
              width: Get.mediaQuery.size.width * 0.26,
            ),
          ),
          W.paddingWidth10(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.mediaQuery.size.width * 0.47,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      W.textBody(
                        cText: restaurants.name,
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      W.textBody(
                        cText: restaurants.city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingBarIndicator(
                        rating: restaurants.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10,
                        direction: Axis.horizontal,
                      ),
                      W.textBody(
                        cText: restaurants.rating.toString(),
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
