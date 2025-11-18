import 'package:intl/intl.dart';

class DateTimeHelper{
  static String formattedDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMMM yyyy hh:mm');
    return formatter.format(now);
  }

  static String getId() => DateTime.now().millisecondsSinceEpoch.toString();
}