import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:proshore_even_manager_app/util/app_router.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                color: AppColors.white.withOpacity(0.5),
                size: 100,
                FontAwesomeIcons.calendarCheck,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Event Manager",
                style: CustomTextStyle.myAppnameTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        context.pushReplacementNamed(AppRouteName.login);
      },
    );
  }
}
