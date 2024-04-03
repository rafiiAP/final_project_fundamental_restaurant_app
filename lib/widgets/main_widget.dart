import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/color.dart';
import '../data/constants/enum.dart';

part 'text_widget.dart';
part 'form_widget.dart';

MainWidget get W => MainWidget._internal();

class MainWidget with TextWidget, FormControlWidget {
  static final MainWidget _instance = MainWidget._internal();
  factory MainWidget() => _instance;
  MainWidget._internal();

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
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
