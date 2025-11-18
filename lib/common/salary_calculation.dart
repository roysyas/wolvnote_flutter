import 'package:intl/intl.dart';

class SalaryCalculation{
  static String calculate(String amount){
    final double salary = double.tryParse(amount) ?? 0.0;

    final double expenditure = (salary * 47.5) / 100;
    final double alms = (salary * 2.5) / 100;
    final double instalment = (salary * 30) / 100;
    final double savings = (salary * 20) / 100;

    final formatter = NumberFormat("#,##0", "id_ID");

    final expenditureString = formatter.format(expenditure);
    final almsString = formatter.format(alms);
    final instalmentString = formatter.format(instalment);
    final savingsString = formatter.format(savings);

    return "Expenditure: $expenditureString\n"
        "Alms: $almsString\n"
        "Instalment: $instalmentString\n"
        "Savings: $savingsString";
  }
}