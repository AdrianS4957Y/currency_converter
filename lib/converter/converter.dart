import 'package:currency_converter/converter/convert.dart';
import 'package:currency_converter/globals/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({
    super.key,
  });

  @override
  ConverterState createState() => ConverterState();
}

class ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: const SafeArea(child: Center(child: Convert())),
    );
  }
}
