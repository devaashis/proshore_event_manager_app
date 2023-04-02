import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';

class CustomButtonStyle {
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(
      color: AppColors.primaryColor,
      width: 1,
      style: BorderStyle.solid,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(31),
    ),
  );

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    padding: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(31),
    ),
  );


  static ButtonStyle disabledButtonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(31),
    ),
  );
}
