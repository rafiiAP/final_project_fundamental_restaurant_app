part of 'main_widget.dart';

mixin TextWidget {
  Widget textBody({
    required String cText,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    List<Shadow>? shadows,
    double? textHeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    TextDecoration textDecoration = TextDecoration.none,
    Color? underlineColor,
    bool isHtml = false,
  }) {
    TextStyle? textStyle;

    textStyle = GoogleFonts.poppins(
      textStyle: Get.textTheme.bodyMedium!.copyWith(
        decoration: textDecoration,
        decorationColor: underlineColor,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows,
        height: textHeight,
        letterSpacing: letterSpacing,
      ),
    );

    return Text(
      cText,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
    );
  }
}
