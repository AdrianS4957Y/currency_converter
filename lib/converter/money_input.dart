import 'package:currency_converter/api/amount.dart';
import 'package:currency_converter/globals/enum_colors.dart';
import 'package:currency_converter/globals/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyInput extends StatefulWidget {
  final String header;
  final Amount amount;
  final void Function(String) onChange;
  const MoneyInput({
    super.key,
    required this.header,
    required this.amount,
    required this.onChange,
  });

  @override
  MoneyInputState createState() => MoneyInputState();
}

class MoneyInputState extends State<MoneyInput> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.amount.fixedAmount);
    // controller.addListener(() {
    //   String text = controller.text;
    //   widget.onChange(text);
    // });
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String newText, Function onChange) {
    final cursorPosition = controller.selection;
    onChange();
    setState(() {
      controller.text = newText;
      controller.selection = cursorPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.amount.fixedAmount;
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 40 / 360,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.header),
            SizedBox(height: MediaQuery.of(context).size.height * 14 / 703),
            Row(
              children: [
                GestureDetector(
                  onTapDown: (details) {},
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/flag${widget.amount.currency.id}.png",
                        width: MediaQuery.of(context).size.width * 45 / 360,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 13 / 360,
                      ),
                      Text(
                        widget.amount.currency.ccy,
                        style: Fonts.roboto(
                          eColor: EColors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/images/down.svg",
                        width: MediaQuery.of(context).size.width * 24 / 360,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 16 / 360,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFefefef),
                  ),
                  width: MediaQuery.of(context).size.width * 141 / 360,
                  child: TextFormField(
                    onChanged: widget.onChange,
                    controller: controller,

                    // initialValue: widget.amount.fixedAmount,
                    textAlign: TextAlign.end,
                    focusNode: focusNode,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 14 / 360,
                          vertical:
                              MediaQuery.of(context).size.height * 11 / 703),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
