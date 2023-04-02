import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class MyProgressDialog extends StatelessWidget {
  String message;

  MyProgressDialog(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          AlertDialog(
            content: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  message,
                  style: CustomTextStyle.myContentPrimaryLargeTextStyle,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
