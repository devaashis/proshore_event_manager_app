import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';

class CustomTextFieldStyle {
  static OutlineInputBorder myOutlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: AppColors.secondaryColor),
    borderRadius: BorderRadius.circular(32.0),
  );

  static OutlineInputBorder myErrorInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: AppColors.errorColor),
    borderRadius: BorderRadius.circular(32.0),
  );
}
