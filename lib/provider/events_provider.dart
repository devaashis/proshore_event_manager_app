import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:proshore_even_manager_app/model/response_events.dart';
import 'package:proshore_even_manager_app/repository/events_repository.dart';
import 'package:proshore_even_manager_app/util/app_router.dart';
import 'package:proshore_even_manager_app/util/date_util.dart';
import 'package:proshore_even_manager_app/widgets/my_snackbar.dart';

enum STATUS { initial, loading, error, success, noInternet, reload }

class EventsProvider extends ChangeNotifier {
  EventsRepository repository = EventsRepository();

  STATUS _pageStatus = STATUS.initial;
  String errorMessage = "";
  String cityName = "";
  bool _reload = false;

  List<ResponseEvents> _events = List.empty(growable: true);
  List<ResponseEvents> _filterEvents = List.empty(growable: true);

  bool get reload => _reload;

  set reload(bool value) {
    _reload = value;
    notifyListeners();
  }

  STATUS get pageStatus => _pageStatus;

  set pageStatus(STATUS value) {
    _pageStatus = value;
    notifyListeners();
  }

  List<ResponseEvents> get events => _events;

  set events(List<ResponseEvents> value) {
    _events = value;
  }

  List<ResponseEvents> get filterEvents => _filterEvents;

  set filterEvents(List<ResponseEvents> value) {
    _filterEvents = value;
    notifyListeners();
  }

  validateFilter(BuildContext context, String filter) {
    if (filter.isEmpty) {
      MySnackBar(context: context).show("Empty Filter");
      return false;
    }
    return true;
  }

  Future<dynamic> getEventsByAddress(BuildContext context,
      {String? address, String? startDate, String? endDate}) async {
    if (pageStatus != STATUS.loading) {
      pageStatus = STATUS.loading;
    }
    dynamic response = await repository.events(
        address: address, startDate: startDate, endate: endDate);
    // dynamic dummyResponse=await repository.eventsFromJson();
    if (response is List<dynamic>) {
      for (var data in response) {
        _events.add(ResponseEvents.fromJson(data));
      }
      _filterEvents = _events;
      pageStatus = STATUS.success;
    } else if (response is DioError) {
      errorMessage = response.message.toString();
      pageStatus = STATUS.error;
      MySnackBar(context: context).show(errorMessage);
    }
    return true;
  }

  Future<dynamic> loadDummyEvents(BuildContext context) async {
    dynamic dummyResponse = await repository.eventsFromJson();
    MySnackBar(context: context).show("Loading test data");
    if (dummyResponse is List<dynamic>) {
      for (var data in dummyResponse) {
        _events.add(ResponseEvents.fromJson(data));
      }
      _filterEvents = _events;
      pageStatus = STATUS.success;
    } else {
      pageStatus = STATUS.error;
      MySnackBar(context: context).show("Failed to load test data");
    }
    return true;
  }

  List<ResponseEvents>? getEvents() {
    _filterEvents = _events;
    return _filterEvents;
  }

  filterEventsByAddress(String searchText) {
    List<ResponseEvents>? result = List.empty(growable: true);
    result.clear();
    result.addAll(events);

    if (result != null) {
      result.retainWhere((element) {
        searchText = searchText.toLowerCase();
        if (element.startDate.toString().toLowerCase().startsWith(searchText)) {
          return true;
        } else if (element.endDate
            .toString()
            .toLowerCase()
            .startsWith(searchText)) {
          return true;
        } else if (element.address
            .toString()
            .toLowerCase()
            .startsWith(searchText)) {
          return true;
        }
        return false;
      });
    }
    filterEvents = result;
  }

  List<ResponseEvents>? filterEventsByStartDate(DateTime selectedDate) {
    List<ResponseEvents> result = List.empty(growable: true);
    for (var data in _events) {
      if (selectedDate.isBefore(data.startDate!)) {
        result.add(data);
      }
    }
    _filterEvents = result;
    return result;
  }

  List<ResponseEvents>? filterEventsByEndDate(DateTime selectedDate) {
    List<ResponseEvents> result = List.empty(growable: true);
    for (var data in _events) {
      if (selectedDate.isAfter(data.endDate!)) {
        result.add(data);
      }
    }
    _filterEvents = result;
    return result;
  }

  List<ResponseEvents>? filterEventsByDates(DateTime start, DateTime end) {
    List<ResponseEvents> result = List.empty(growable: true);
    for (var data in _events) {
      if (start.isBefore(data.startDate!) && end.isAfter(data.endDate!)) {
        result.add(data);
      }
    }
    _filterEvents = result;
    return result;
  }
}
