import 'package:intl/intl.dart';

class DigitsFormatter{
  static String format(String input) {
    final digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';

    final number = int.tryParse(digits);
    if (number == null) return '';

    return NumberFormat.decimalPattern('id').format(number);
  }
}