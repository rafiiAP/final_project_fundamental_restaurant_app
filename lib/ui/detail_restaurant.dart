// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/color.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/constants/image.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';

import 'package:restaurant_app/get/detail_restaurant_get.dart';
import 'package:restaurant_app/widgets/main_widget.dart';

class DetailRestaurantPage extends StatelessWidget {
  final String id;

  const DetailRestaurantPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final DetailGetx ctrl = Get.put(DetailGetx(id: id));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColorConfig.white,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(
        () => ctrl.isLoading.value
            ? const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Obx(
                        () => Image.network(
                          imageURL + ctrl.restaurantDetail.value.pictureId!,
                          fit: BoxFit.cover,
                          width: Get.mediaQuery.size.width,
                          height: Get.size.height / 3,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -22),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          margin: const EdgeInsets.only(right: 32),
                          shape: const CircleBorder(),
                          child: Obx(
                            () => ctrl.isFavorite.value
                                ? IconButton(
                                    onPressed: () {
                                      ctrl.removeFavorite();
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: AppColorConfig.deepCarminePink,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      ctrl.addFavorite();
                                    },
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: AppColorConfig.grey,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => W.textBody(
                              cText: ctrl.restaurantDetail.value.name!,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          W.paddingHeight16(),
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: AppColorConfig.green,
                                size: 15,
                              ),
                              W.paddingHeight5(),
                              Expanded(
                                child: Obx(
                                  () => W.textBody(
                                    cText: ctrl.restaurantDetail.value.city!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          W.paddingHeight5(),
                          Row(
                            children: [
                              Obx(
                                () => RatingBar(
                                  itemSize: 20,
                                  allowHalfRating: true,
                                  initialRating:
                                      ctrl.restaurantDetail.value.rating!,
                                  ratingWidget: RatingWidget(
                                    full: const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    half: const Icon(
                                      Icons.star_half,
                                      color: Colors.amber,
                                    ),
                                    empty: const Icon(
                                      Icons.star_border,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  onRatingUpdate: (rating) {
                                    // print(rating);
                                  },
                                ),
                              ),
                              W.paddingHeight5(),
                              Expanded(
                                child: Obx(
                                  () => W.textBody(
                                    cText: ctrl.restaurantDetail.value.rating
                                        .toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          W.paddingHeight16(),
                          W.textBody(
                            cText: 'Description',
                            fontWeight: FontWeight.bold,
                          ),
                          W.paddingHeight16(),
                          Obx(
                            () => W.textBody(
                              cText: ctrl.restaurantDetail.value.description!,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          W.paddingHeight16(),
                          W.textBody(
                            cText: 'Foods',
                            fontWeight: FontWeight.bold,
                          ),
                          W.paddingHeight16(),
                          SizedBox(
                            height: 150,
                            child: Obx(
                              () => ListView.builder(
                                padding: const EdgeInsets.all(5),
                                itemCount: ctrl
                                    .restaurantDetail.value.menus!.foods.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  Drink category = ctrl
                                      .restaurantDetail.value.menus!.foods[i];

                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: 170,
                                    child: InkWell(
                                      onTap: () {
                                        Get.showSnackbar(
                                          GetSnackBar(
                                            message: category.name,
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.asset(
                                                imageFood,
                                                fit: BoxFit.fill,
                                                width:
                                                    Get.mediaQuery.size.width,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: W.textBody(
                                                  cText: category.name,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          W.textBody(
                            cText: 'Drinks',
                            fontWeight: FontWeight.bold,
                          ),
                          W.paddingHeight16(),
                          SizedBox(
                            height: 150,
                            child: Obx(
                              () => ListView.builder(
                                itemCount: ctrl.restaurantDetail.value.menus!
                                    .drinks.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  Drink category = ctrl
                                      .restaurantDetail.value.menus!.drinks[i];
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: 170,
                                    child: InkWell(
                                      onTap: () {
                                        Get.showSnackbar(
                                          GetSnackBar(
                                            message: category.name,
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.asset(
                                                imageDrink,
                                                fit: BoxFit.fill,
                                                width:
                                                    Get.mediaQuery.size.width,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: W.textBody(
                                                cText: category.name,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
