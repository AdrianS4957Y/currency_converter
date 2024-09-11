import 'package:currency_converter/api/currency.dart';
import 'package:currency_converter/globals/enum_colors.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/globals/fonts.dart';

class CurrencyListItem extends StatefulWidget {
  final Currency currency;
  final Function onClick;
  final bool selected;
  const CurrencyListItem({
    super.key,
    required this.currency,
    required this.onClick,
    required this.selected,
  });

  @override
  CurrencyListItemState createState() => CurrencyListItemState();
}

class CurrencyListItemState extends State<CurrencyListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 5 / 471),
      child: GestureDetector(
        onTapDown: (event) {
          setState(() {
            widget.onClick();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0x5BFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 11 / 471),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 38 / 471,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/flag${widget.currency.id}.png",
                    width: MediaQuery.of(context).size.width * 45 / 360,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 12 / 360,
                  ),
                  Text(
                    widget.currency.ccy,
                    style: Fonts.roboto(
                      color: Fonts.colors[EColors.blue],
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Radio(
                value: widget.selected,
                groupValue: true,
                onChanged: (str) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
