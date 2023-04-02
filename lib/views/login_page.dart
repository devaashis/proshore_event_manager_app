import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:proshore_even_manager_app/provider/login_provider.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/widgets/custom_button_widget.dart';
import 'package:proshore_even_manager_app/widgets/custom_text_field_widget.dart';
import 'package:proshore_even_manager_app/widgets/custom_text_widget.dart';
import 'package:proshore_even_manager_app/widgets/my_snackbar.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginProvider loginProvider;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = 'test@gmail.com';
    _passwordController.text = '12345678';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 11.h,
                ),
                Center(
                  // child: Image.asset(
                  //   "assets/images/logo.png",
                  //   width: 48,
                  //   height: 48,
                  //   fit: BoxFit.cover,
                  // ),
                  child: FaIcon(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    size: 64,
                    FontAwesomeIcons.calendarCheck,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In to your account",
                    style: CustomTextStyle.myDisplayTextStyle,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                RequiredFieldTitleWidget(title: "Email"),
                CustomTextField(
                  hint: "Email",
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email is required'),
                  ]),
                  onChanged: (value) {},
                  keyboardtype: TextInputType.emailAddress,
                  maxlength: 10,
                  textEditingController: _emailController,
                ),
                RequiredFieldTitleWidget(
                  title: "Password",
                ),
                Consumer<LoginProvider>(
                  builder: (context, value, child) {
                    return CustomTextField(
                      textEditingController: _passwordController,
                      hint: "Password",
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Password is required'),
                      ]),
                      onChanged: (value) {
                        // context.read<LoginBloc>().add(
                        //     LoginPasswordChangeEvent(changedPassword: value));
                      },
                      hidePassword: loginProvider.hidePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginProvider.hidePassword = !loginProvider.hidePassword;
                        },
                        icon: Consumer<LoginProvider>(
                          builder: (context, value, child) {
                            if (loginProvider.hidePassword) {
                              return const Icon(Icons.visibility_off);
                            }
                            return const Icon(Icons.visibility);
                          },
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomElevatedButton(
                  onClick: () {
                    loginProvider.login(context, _emailController.text,
                        _passwordController.text);
                  },
                  buttonText: "Sign In",
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
