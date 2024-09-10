import 'package:currency_converter/api/currency_api.dart';
import 'package:currency_converter/globals/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        CurrencyApi api = CurrencyApi();
        return api;
      },
      child: const MaterialApp(
        initialRoute: "/loading",
        onGenerateRoute: Routes.generateRoutes,
      ),
    ),
  );
}
