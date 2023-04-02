import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RequiredFieldTitleWidget extends StatelessWidget {
  RequiredFieldTitleWidget(
      {required this.title, this.isRequiredField = true, Key? key})
      : super(key: key);

  String title;
  bool isRequiredField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 16),
      child: RichText(
        text: TextSpan(
            style: CustomTextStyle.myHeadingTextStyle,
            text: "$title ",
            children: [
              isRequiredField
                  ? TextSpan(
                  text: '*', style: CustomTextStyle.myErrorTextStyle)
                  : TextSpan()
            ]),
      ),
    );
  }
}

class ErrorFieldTextWidget extends StatelessWidget {
  ErrorFieldTextWidget({required this.errorMessage, Key? key})
      : super(key: key);

  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.errorContainerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.info,
              color: AppColors.errorColor,
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              errorMessage,
              style: CustomTextStyle.myErrorTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
