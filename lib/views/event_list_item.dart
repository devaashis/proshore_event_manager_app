import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/model/response_events.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';

class EventListItem extends StatelessWidget {
  final ResponseEvents? data;

  EventListItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
                color: AppColors.secondaryColor,
                width: 1.0,
                style: BorderStyle.solid),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                padding: const EdgeInsets.all(25.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  "${data?.picture}",
                  errorBuilder: (ctx, obj, _) {
                    return Image.asset("assets/images/logo.png");
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "${data?.name}",
                  maxLines: 1,
                  style: CustomTextStyle.myContentPrimaryLargeTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                height: 80,
                child: Text(
                  "${data?.description}",
                  maxLines: 4,
                  style: CustomTextStyle.myContentPrimaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
