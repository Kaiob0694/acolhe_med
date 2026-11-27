class AppDateUtils {
  AppDateUtils._();

  static String _two(int n) => n.toString().padLeft(2, '0');

  /// 09/11/2026
  static String formatDate(DateTime d) =>
      '${_two(d.day)}/${_two(d.month)}/${d.year}';

  /// 09:15
  static String formatTime(DateTime d) => '${_two(d.hour)}:${_two(d.minute)}';

  static bool isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }
}
