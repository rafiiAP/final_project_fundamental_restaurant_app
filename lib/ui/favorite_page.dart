import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/color.dart';
import 'package:restaurant_app/get/favorite_get.dart';

import '../data/api/api_service.dart';
import '../data/model/restaurant_list_model.dart';
import '../widgets/main_widget.dart';
import 'detail_restaurant.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final FavoriteGet ctrl = Get.put(FavoriteGet());

  @override
  Widget build(BuildContext context) {
    ctrl.getFavorite();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => ctrl.isLoading.value
              ? wCircularProgres()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ctrl.vaRestaurant.value.length,
                        itemBuilder: (context, index) {
                          RestaurantListModel restaurants =
                              ctrl.vaRestaurant.value[index];
                          return InkWell(
                            onTap: () {
                              Get.to(DetailRestaurantPage(
                                id: restaurants.id,
                              ))!
                                  .then((value) => ctrl.getFavorite());
                            },
                            child: cardList(restaurants),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Center wCircularProgres() {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Padding cardList(RestaurantListModel restaurants) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
                  // width: Get.mediaQuery.size.width * 0.47,
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
                IconButton(
                  onPressed: () {
                    ctrl.removeFavorite(restaurants);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: AppColorConfig.deepCarminePink,
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
