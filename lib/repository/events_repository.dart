import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:proshore_even_manager_app/model/response_events.dart';
import 'package:proshore_even_manager_app/network/api_service.dart';
import 'package:proshore_even_manager_app/util/app_constants.dart';

class EventsRepository {
  APIService apiService = APIService();

  Future<dynamic> events({
    String? address,
    String? startDate,
    String? endate,
  }) async {
    try {
      var params = {
        "address": "$address",
      };

      List<dynamic> response =
          await apiService.request(Method.GET, AppConstants.events, params);
      return response;
    } on DioError catch (e) {
      return e;
    }
  }
}
