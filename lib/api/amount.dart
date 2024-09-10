import 'package:currency_converter/api/currency.dart';

class Amount {
  late Currency currency;
  double amount;
  Amount(this.currency, {this.amount = 1});
  double convert(Currency anotherCurrency) {
    return amount * currency.rate / anotherCurrency.rate;
  }

  String convertAsFixed(Currency anotherCurrency) {
    double money = amount * currency.rate / anotherCurrency.rate;
    if (money.toStringAsFixed(2) == "0.00") {
      return money.toStringAsFixed(4);
    } else {
      return money.toStringAsFixed(2);
    }
  }

  String get fixedAmount {
    if (amount.toStringAsFixed(2) == "0.00") {
      return amount.toStringAsFixed(4);
    } else {
      return amount.toStringAsFixed(2);
    }
  }
}
