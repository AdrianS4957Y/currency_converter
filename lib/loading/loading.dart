import 'dart:async';

import 'package:currency_converter/api/amount.dart';
import 'package:currency_converter/api/currency_api.dart';
import 'package:currency_converter/globals/fonts.dart';
import 'package:currency_converter/globals/globals.dart';
import 'package:currency_converter/globals/routes.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({
    super.key,
  });

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  @override
  void initState() {
    final provider = Provider.of<CurrencyApi>(context, listen: false);
    Future.microtask(() async {
      if (MediaQuery.of(context).size.height > 480 &&
          MediaQuery.of(context).size.height < 800) {
        setFontSizeMultiplier(1);
      } else if (MediaQuery.of(context).size.height < 1000) {
        setFontSizeMultiplier(1.15);
      } else {
        setFontSizeMultiplier(1.3);
      }
      await provider.getDB();
    }).then((response) {
      provider.changeCurrencies(Amount(provider.currencyList.first),
          Amount(provider.currencyList.last));
      Navigator.pushNamed(context, Routes.converter);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBackgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: const Color(0xFFFFFFFF),
            size: MediaQuery.of(context).size.height * 24 / 471,
          ),
        ),
      ),
    );
  }
}
