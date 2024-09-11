import 'package:currency_converter/api/currency.dart';
import 'package:currency_converter/api/currency_api.dart';
import 'package:currency_converter/globals/custom_app_bar.dart';
import 'package:currency_converter/globals/enum_colors.dart';
import 'package:currency_converter/globals/fonts.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/search/currencies_list.dart';
import 'package:currency_converter/search/custom_search_bar.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  final List<Currency> selectedCurrencies;
  final Currency currencyThatShouldBeChanged;
  const Search({
    super.key,
    required this.selectedCurrencies,
    required this.currencyThatShouldBeChanged,
  });

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  late CurrencyApi provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<CurrencyApi>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Fonts.colors[EColors.background],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 15 / 471,
            horizontal: MediaQuery.of(context).size.width * 15 / 218,
          ),
          child: Column(
            children: [
              CustomSearchBar(
                onChange: (String text) {
                  setState(() {
                    provider.filter((c) =>
                        c.ccy.toLowerCase().contains(text.toLowerCase()));
                  });
                },
              ),
              Expanded(
                child: CurrenciesList(
                  selectedCurrencies: widget.selectedCurrencies,
                  currencyThatShouldBeChanged:
                      widget.currencyThatShouldBeChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
