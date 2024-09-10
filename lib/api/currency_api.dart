import "dart:convert";

import "package:currency_converter/api/currency.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class CurrencyApi extends ChangeNotifier {
  List<Currency> currencyList = [];
  Currency? _first;
  Currency? _second;
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
    currencyList = list;
    return list;
  }

  Currency? get first => _first;
  Currency? get second => _second;
  set first(Currency? c) {
    first = c;
  }

  set second(Currency? c) {
    second = c;
  }
}
