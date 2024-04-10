import 'package:intl/intl.dart';

class AppUtils {
  AppUtils._();

  static String thousandFormator(dynamic amount) {
    NumberFormat format = NumberFormat("#,##0.00", "en_US");
    return format.format(amount);
  }

  static String getTodayDate() {
    return DateFormat("dd/MM/yy").format(DateTime.now());
  }

  static String getTomorrowDate() {
    return DateFormat("dd/MM/yy")
        .format(DateTime.now().add(const Duration(days: 1)));
  }

  static String getFormat(String format, DateTime picked) {
    return DateFormat(format).format(picked);
  }
}
