import 'package:pharmarack/packages/core/log_util/log_util.dart';

class RetailerUtils {
  RetailerUtils._();

  static String getFreeTabletsCountAsPerScheme(String? scheme, int quantity) {
    int totalFreeCount = 0;
    if (scheme != null && scheme.isNotEmpty) {
      List schemes = scheme.split(',');
      for (String scheme in schemes) {
        try {
          int minQuantity = int.parse(scheme.split('+')[0]);
          int freeWithMinQuantity = int.parse(scheme.split('+')[1]);
          if (quantity < minQuantity) {
            continue;
          } else {
            totalFreeCount = (quantity ~/ minQuantity) * freeWithMinQuantity;
          }
        } on Exception {
          LogUtil.error("Invalid scheme");
        }
      }
    }
    return totalFreeCount == 0 ? 'HS' : '$totalFreeCount';
  }

  static (int, String) getAppliedSchemeAndFreeCount(
      String? scheme, int quantity) {
    int totalFreeCount = 0;
    String appliedScheme = "";
    if (scheme != null && scheme.isNotEmpty) {
      List schemes = scheme.split(',');
      for (String scheme in schemes) {
        try {
          int minQuantity = int.parse(scheme.split('+')[0]);
          int freeWithMinQuantity = int.parse(scheme.split('+')[1]);
          if (quantity < minQuantity) {
            continue;
          } else {
            totalFreeCount = (quantity ~/ minQuantity) * freeWithMinQuantity;
            appliedScheme = scheme;
          }
        } on Exception {
          LogUtil.error("Invalid scheme");
        }
      }
    }
    return (totalFreeCount, appliedScheme);
  }
}
