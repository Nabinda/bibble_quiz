class Utils {
  static String twoDigit(int count) {
    if (count < 10) {
      return '0$count';
    } else {
      return '$count';
    }
  }
}
