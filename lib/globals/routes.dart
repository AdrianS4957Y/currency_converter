import 'package:currency_converter/converter/converter.dart';
import 'package:currency_converter/loading/loading.dart';
import 'package:flutter/material.dart';

class Routes {
  static const loading = "/loading";
  static const converter = "/converter";
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final WidgetBuilder builder = switch (settings.name) {
      converter => (context) => const Converter(),
      _ => (context) => const Loading(),
    };
    return MaterialPageRoute(
      settings: settings,
      builder: builder,
    );
  }
}
