import 'package:currency_converter/api/amount.dart';
import 'package:currency_converter/globals/enum_colors.dart';
import 'package:currency_converter/globals/fonts.dart';
import 'package:flutter/material.dart';

class ChangeRate extends StatefulWidget {
  final Amount first;
  final Amount second;
  const ChangeRate({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  ChangeRateState createState() => ChangeRateState();
}

class ChangeRateState extends State<ChangeRate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 20 / 360,
        vertical: MediaQuery.of(context).size.height * 30 / 703,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indicative Exchange Rate",
            style: Fonts.roboto(
              fontSize: 16,
              eColor: EColors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "${widget.first.amount} = ${widget.first.convertAsFixed(widget.second.currency)}",
            style: Fonts.roboto(
              fontSize: 18,
              eColor: EColors.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
