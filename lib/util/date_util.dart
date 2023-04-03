import 'package:intl/intl.dart';

class MyDateUtil{
  static String formatDate(DateTime? dateTime){
    if(dateTime==null)
      return "";
    return DateFormat('MMM d, yyyy').format(dateTime);
  }
}