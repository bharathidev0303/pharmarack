import 'package:intl/intl.dart';

class DateFormatUtils {
  static final DateFormat _dMmmYyyy =
      DateFormat("d MMM yyyy"); //"2023-11-16T16:27:05.62307";

  static String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return "";
    }
    DateTime dateTime = DateTime.parse(dateString);
    return _dMmmYyyy.format(dateTime);
  }

  static String getCurrentDateTime() {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
  }

  static int getDateTimeDifference(String startTime, String endTime) {
    DateTime dt1 = DateTime.parse(startTime);
    DateTime dt2 = DateTime.parse(endTime);
    Duration diff = dt2.difference(dt1);
    return diff.inSeconds;
  }
}
