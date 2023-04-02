import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:proshore_even_manager_app/network/api_service.dart';
import 'package:proshore_even_manager_app/util/app_constants.dart';

class LoginRepository {
  APIService apiService = APIService();

  Future<dynamic> login(
      {required String username,required String password}) async {
    try {
      var params = {
        "username": "$username",
        "password": "$password",
      };

      Map<String, dynamic> response =
      await apiService.request(Method.POST, AppConstants.login, params);
      return response;
    } on DioError catch (e) {
      return e;
    }
  }
}
