import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/text_field_styles.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final FormFieldValidator<String> validator;
  final TextEditingController textEditingController;
  final TextInputAction inputActionType;
  final TextInputType keyboardtype;
  final TextCapitalization textCapitalization;
  final double? height;
  final double? width;
  final int? maxlength;
  final int? maxline;
  final VoidCallback? onTap;
  final Function(String value)? onChanged;
  final bool? hidePassword;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? isReadOnly;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.validator,
    required this.textEditingController,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onChanged,
    this.height,
    this.width,
    this.inputActionType = TextInputAction.next,
    this.keyboardtype = TextInputType.text,
    this.maxlength = null,
    this.hidePassword,
    this.suffixIcon,
    this.obscureText,
    this.maxline = null,
    this.isReadOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 6.h,
      width: width ?? double.infinity,
      margin: const EdgeInsets.only(top: 9),
      child: TextFormField(
        textCapitalization: textCapitalization,
        maxLines: 1,
        expands: false,
        maxLength: maxlength,
        smartDashesType: SmartDashesType.disabled,
        keyboardType: keyboardtype,
        textInputAction: inputActionType,
        controller: textEditingController,
        obscureText: hidePassword ?? false,
        decoration: InputDecoration(
            counterText: "",
            hintText: hint,
            hintStyle: CustomTextStyle.myHintTextStyle,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: CustomTextFieldStyle.myOutlineInputBorder,
            focusedBorder: CustomTextFieldStyle.myOutlineInputBorder,
            enabledBorder: CustomTextFieldStyle.myOutlineInputBorder,
            errorBorder: CustomTextFieldStyle.myErrorInputBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
            suffixIcon: suffixIcon),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onChanged: onChanged,
        readOnly: isReadOnly ?? false,
        onTap: onTap,
      ),
    );
  }
}
