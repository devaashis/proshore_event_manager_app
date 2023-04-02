import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';

class CustomTextStyle {
  static TextStyle myAppBarTextStyle = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );

  // For main display text in page
  static TextStyle myDisplayTextStyle = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle myAppnameTextStyle = const TextStyle(
    color: AppColors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.w500,
  );

  // For form labels and
  static TextStyle myLabelTextStyle = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle myHintTextStyle = const TextStyle(
    color: AppColors.neutralColor,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle myHeadingTextStyle = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );


  static TextStyle myContentPrimaryLargeTextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.iconColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle myContentPrimaryTextStyle = TextStyle(
    fontSize: 12.0,
    color: AppColors.iconColor.withOpacity(0.5),
    fontWeight: FontWeight.w500,
  );

  static TextStyle myContentSecondaryLargeTextStyle = const TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle myContentSecondaryTextStyle = const TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
  );


  static TextStyle myFilledButtonTextStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle myOutlineButtonTextStyle = const TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle myErrorTextStyle = const TextStyle(
    fontSize: 11.0,
    color: AppColors.errorColor,
    fontWeight: FontWeight.normal,
  );
}
