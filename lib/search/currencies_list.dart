import 'package:currency_converter/api/amount.dart';
import 'package:currency_converter/api/currency.dart';
import 'package:currency_converter/api/currency_api.dart';
import 'package:currency_converter/globals/routes.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/search/currency_list_item.dart';
import 'package:provider/provider.dart';

class CurrenciesList extends StatefulWidget {
  final List<Currency> selectedCurrencies;
  final Currency currencyThatShouldBeChanged;
  const CurrenciesList({
    super.key,
    required this.selectedCurrencies,
    required this.currencyThatShouldBeChanged,
  });

  @override
  CurrenciesListState createState() => CurrenciesListState();
}

class CurrenciesListState extends State<CurrenciesList> {
  late CurrencyApi provider;
  List<Widget> createList(List<Currency> list, BuildContext context) {
    return list.map((currency) {
      bool contains = false;
      for (Currency c in widget.selectedCurrencies) {
        contains = c.id == currency.id;
        if (contains) break;
      }
      if (contains) {
        true;
      }
      return CurrencyListItem(
        currency: currency,
        selected: contains,
        onClick: () {
          widget.currencyThatShouldBeChanged.id ==
                  (provider.first?.currency.id ?? "0")
              ? provider.changeCurrencies(Amount(currency), provider.second!)
              : provider.changeCurrencies(provider.first!, Amount(currency));
          Navigator.pushNamed(context, Routes.converter);
        },
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    provider = Provider.of<CurrencyApi>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 15 / 471),
      child: SingleChildScrollView(
          child: Column(
        children: createList(provider.currencyList, context),
      )),
    );
  }
}
