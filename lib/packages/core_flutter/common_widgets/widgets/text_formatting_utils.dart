class TextFormattingUtils {
  static String formatSingleDigitNumberWithZero(String value) {
    return value.padLeft(2, '0');
  }
}
