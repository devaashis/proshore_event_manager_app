import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:proshore_even_manager_app/repository/login_repository.dart';
import 'package:proshore_even_manager_app/util/app_router.dart';
import 'package:proshore_even_manager_app/widgets/my_snackbar.dart';

enum STATUS { initial, loading, error, success, noInternet, reload }

class LoginProvider extends ChangeNotifier {
  LoginRepository repository = LoginRepository();

  STATUS _pageStatus = STATUS.initial;
  String errorMessage = "";
  String cityName = "";
  bool _reload = false;
  bool _hidePassword = true;

  bool get reload => _reload;

  set reload(bool value) {
    _reload = value;
    notifyListeners();
  }


  bool get hidePassword => _hidePassword;

  set hidePassword(bool value) {
    _hidePassword = value;
    notifyListeners();

  }

  STATUS get pageStatus => _pageStatus;

  set pageStatus(STATUS value) {
    _pageStatus = value;
    notifyListeners();
  }

  validateUsername(BuildContext context, String username) {
    if (username.isEmpty) {
      MySnackBar(context: context).show("Empty Email");
      return false;
    } else if (username.length < 4) {
      MySnackBar(context: context).show("Email must be atleast 4 character ");
      return false;
    }
    return true;
  }

  Future<dynamic> login(
      BuildContext context, String username, String password) async {
    if (pageStatus != STATUS.loading) {
      pageStatus = STATUS.loading;
    }
    // dynamic response =
    //     await repository.login(username: username, password: password);
    context.pushNamed(AppRouteName.home);

    // if (response is Map<String, dynamic>) {
    //   // if (response["status"]) {
    //   //   context.pushNamed(AppRouteName.home);
    //   // } else {
    //   //   MySnackBar(context: context).show(response['message']);
    //   // }
    //   context.pushNamed(AppRouteName.home);
    // }
    return true;
  }
}
