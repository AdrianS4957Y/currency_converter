import "dart:convert";

import "package:currency_converter/api/amount.dart";
import "package:currency_converter/api/currency.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class CurrencyApi extends ChangeNotifier {
  List<Currency> currencyList = [];
  List<Currency> initialCurrencyList = [];
  Amount? _first;
  Amount? _second;
  getDB() async {
    List<Currency> list = [];
    dynamic data = (await http.get(
      Uri.https("cbu.uz", "/oz/arkhiv-kursov-valyut/json/"),
    ))
        .body;
    List<dynamic> json = jsonDecode(data);
    list = json
        .map((element) => Currency.parseJson(element as Map<String, dynamic>))
        .toList();
    initialCurrencyList = list;
    initialCurrencyList.add(
      Currency(
        ccy: "UZS",
        rate: "1.0",
        ccyNmEn: "Uzbekistan sum",
        ccyNmRu: "Узбекский сум",
        ccyNmUz: "O'zbek so'mi",
        ccyNmUzc: "Узбек суми",
        code: "76",
        date: DateTime.now(),
        diff: 1,
        id: 76,
        nominal: "1",
      ),
    );
    currencyList = initialCurrencyList;
    return list;
  }

  void changeCurrencies(Amount first, Amount second) {
    _first = first;
    _second = second;
  }

  void filter(bool Function(Currency) test) {
    currencyList = initialCurrencyList.where(test).toList();
  }

  Amount? get first => _first;
  Amount? get second => _second;
}
