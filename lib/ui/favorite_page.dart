import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/get/favorite_get.dart';

import '../widgets/main_widget.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final FavoriteGet ctrl = Get.put(FavoriteGet());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: W.textBody(
          cText: "Restaurant",
          fontSize: 22,
        ),
      ),
    );
  }
}
