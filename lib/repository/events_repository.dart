import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
      Map<String,dynamic> params={};
      if(address?.isNotEmpty ?? false){
        params["address"]=address;
      }
      if(startDate?.isNotEmpty ?? false){
        params["start_date"]=startDate;
      }
      if(endate?.isNotEmpty ?? false){
        params["end_date"]=endate;
      }
      // var params = {
      //   "address": "$address",
      // };

      List<dynamic> response =
          await apiService.request(Method.GET, AppConstants.events, params);
      return response;
    } on DioError catch (e) {
      return e;
    }
  }

  // Fetch content from the json file
  Future<dynamic> eventsFromJson() async {
    final String response =
    await rootBundle.loadString('assets/json/locations.json');
    final data = await json.decode(response);
    return data;
  }
}
