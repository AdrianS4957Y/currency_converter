import 'package:currency_converter/globals/enum_colors.dart';
import 'package:currency_converter/globals/fonts.dart';
import 'package:flutter/material.dart';

class Swap extends StatefulWidget {
  final Function(TapDownDetails) onClick;
  const Swap({
    super.key,
    required this.onClick,
  });

  @override
  SwapState createState() => SwapState();
}

class SwapState extends State<Swap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 1,
              color: Fonts.colors[EColors.grey],
            ),
          )),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 44 / 703,
              width: MediaQuery.of(context).size.width * 44 / 360,
              decoration: const BoxDecoration(
                color: Color(0xFF26278D),
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTapDown: widget.onClick,
                child: Container(
                  height: MediaQuery.of(context).size.height * 20 / 703,
                  width: MediaQuery.of(context).size.width * 20 / 360,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 12 / 703,
                    horizontal: MediaQuery.of(context).size.width * 14 / 360,
                  ),
                  child: Image.asset(
                    "assets/images/exchanger.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 1,
              color: Fonts.colors[EColors.grey],
            ),
          )),
        ],
      ),
    );
  }
}
