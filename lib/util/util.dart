import 'package:intl/intl.dart';

String formatCurrency(String amountString) {
  final int amount = int.parse(amountString);
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
  return currencyFormatter.format(amount);
}
