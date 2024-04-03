part of 'main_widget.dart';

mixin FormControlWidget {
  Widget input({
    TextInputType keyboardType = TextInputType.text,
    AutovalidateMode? autoValidateMode,
    FormFieldValidator<String>? validator,
    bool? enabled,
    Widget? icon,
    String? hintText,
    TextEditingController? controller,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Function(String)? onChanged,
    Function(String?)? onSaved,
    Function(String)? onFieldSubmitted,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    TextAlign? textAlign,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    int? maxLength,
    BorderRadius? borderRadius,
    Widget? suffixIcon,
    bool readOnly = false,
    JenisInput jenisInput = JenisInput.outline,
    bool filled = true,
    Color? color,
    Widget? prefixIcon,
  }) {
    textAlign ??= TextAlign.start;

    borderRadius ??= const BorderRadius.all(Radius.circular(10));

    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      readOnly: readOnly,
      enabled: enabled,
      autovalidateMode: autoValidateMode,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: filled,
        prefixIcon: prefixIcon,
        // fillColor: Color(0xFFeeeef8),
        fillColor: AppColorConfig.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: jenisInput == JenisInput.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: AppColorConfig.grey,
                ),
                // borderSide: BorderSide.none,
              )
            : UnderlineInputBorder(
                borderRadius: borderRadius,
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColorConfig.grey,
          ),
          // borderSide: BorderSide.none,
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: borderRadius,
        //   borderSide: BorderSide(
        //     color: AppColorConfig.secondary,
        //   ),
        //   // borderSide: BorderSide.none,
        // ),
        icon: icon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        errorMaxLines: 3,
      ),
      style: GoogleFonts.poppins(
        textStyle: Get.textTheme.bodyMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: color,
        ),
      ),
      controller: controller,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textInputAction: textInputAction,
      textAlign: textAlign,
      maxLength: maxLength,
    );
  }
}
