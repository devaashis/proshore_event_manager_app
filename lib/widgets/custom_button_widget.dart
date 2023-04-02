import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/button_styles.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';


class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {required this.onClick,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight,
      Key? key})
      : super(key: key);

  VoidCallback onClick;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 62,
      child: ElevatedButton(
        onPressed: onClick,
        style: CustomButtonStyle.elevatedButtonStyle,
        child: Text(
          buttonText,
          style: CustomTextStyle.myFilledButtonTextStyle,
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton(
      {required this.onClick,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight,
      Key? key})
      : super(key: key);

  VoidCallback onClick;
  Color? buttonColor;
  double? borderRadius;
  Color? textColor;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 62,
      child: OutlinedButton(
        style: CustomButtonStyle.outlinedButtonStyle,
        onPressed: onClick,
        child: Text(
          buttonText,
          style: CustomTextStyle.myOutlineButtonTextStyle,
        ),
      ),
    );
  }
}

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    Key? key,
    required this.icon,
    required this.onTapFunction,
    this.leftIconPadding,
    this.rightIconPadding,
  }) : super(key: key);

  final IconData icon;
  final Function() onTapFunction;
  final double? leftIconPadding;
  final double? rightIconPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      onTap: onTapFunction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: leftIconPadding ?? 4,
            right: rightIconPadding ?? 0,
          ),
          child: Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
