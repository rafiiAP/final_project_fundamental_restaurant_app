import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/color.dart';
import '../data/constants/enum.dart';
import '../data/constants/image.dart';

part 'text_widget.dart';
part 'form_widget.dart';

MainWidget get W => MainWidget._internal();

class MainWidget with TextWidget, FormControlWidget {
  static final MainWidget _instance = MainWidget._internal();
  factory MainWidget() => _instance;
  MainWidget._internal();

  msgNoConnection({
    required dynamic Function()? onPressed,
  }) {
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
                onPressed: onPressed,
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

  Widget paddingHeight16() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget paddingHeight10() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget paddingHeight5() {
    return const SizedBox(
      height: 5,
    );
  }

  Widget paddingWidth16() {
    return const SizedBox(
      width: 16,
    );
  }

  Widget paddingWidth10() {
    return const SizedBox(
      width: 10,
    );
  }

  Widget paddingWidth5() {
    return const SizedBox(
      width: 5,
    );
  }

  Widget button({
    required Function()? onPressed,
    required Widget child,
    Color? textColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    textColor ??= Get.theme.colorScheme.onPrimary;
    backgroundColor ??= Get.theme.colorScheme.primary;
    padding ??= const EdgeInsets.symmetric(
      vertical: 18,
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
