import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/model/response_events.dart';
import 'package:proshore_even_manager_app/util/date_util.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';

class EventListItem extends StatelessWidget {
  final ResponseEvents? data;

  EventListItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => displayBottomSheet(context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.3), width: 1.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              "${data?.picture}",
              fit: BoxFit.contain,
              height: 100,
              width: 100,
              errorBuilder: (ctx, obj, _) {
                return Icon(
                  Icons.event,
                  size: 50,
                  color: AppColors.primaryColor.withOpacity(0.5),
                );
                return Image.asset("assets/images/logo.png");
              },
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data?.name}",
                  maxLines: 1,
                  style: CustomTextStyle.myContentSecondaryLargeTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4,),

                Text(
                  "${data?.description}",
                  maxLines: 4,
                  style: CustomTextStyle.myContentPrimaryTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2,),

                Text(
                  "${data?.address}",
                  maxLines: 4,
                  style: CustomTextStyle.myContentPrimaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      elevation: 5,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data?.name}",
                    maxLines: 1,
                    style: CustomTextStyle.myContentSecondaryLargeTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Divider(),
                  Text(
                    "${data?.description}",
                    maxLines: 4,
                    style: CustomTextStyle.myContentPrimaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Address: ${data?.address}",
                    maxLines: 4,
                    style: CustomTextStyle.myContentPrimaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16,),
                  Text(
                    "Start Date: ${MyDateUtil.formatDate(data?.startDate)}",
                    maxLines: 4,
                    style: CustomTextStyle.myContentSecondaryLargeTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "End Date: ${MyDateUtil.formatDate(data?.endDate)}",
                    maxLines: 4,
                    style: CustomTextStyle.myContentSecondaryLargeTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
