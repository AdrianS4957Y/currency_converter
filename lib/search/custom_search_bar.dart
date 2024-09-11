import 'package:flutter/material.dart';
import 'package:currency_converter/globals/fonts.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onChange;
  const CustomSearchBar({
    super.key,
    required this.onChange,
  });

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 50 / 703,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 14 / 360,
          vertical: MediaQuery.of(context).size.height * 13 / 703,
        ),
        decoration: BoxDecoration(
          color: const Color(0x99FFFFFF),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/images/search.png",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 24 / 703,
                  ),
                  Expanded(
                    child: Center(
                      child: TextField(
                        onChanged: widget.onChange,
                        onSubmitted: (value) {},
                        style: Fonts.roboto(
                          fontSize: 14,
                          color: const Color(0xFFAEAEAE),
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 17 / 360,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          fillColor: const Color(0x00000000),
                          hintText: "Search",
                          labelStyle: Fonts.roboto(
                            fontSize: 14,
                            color: const Color(0xFFAEAEAE),
                            fontWeight: FontWeight.w600,
                          ),
                          hintStyle: Fonts.roboto(
                            fontSize: 14,
                            color: const Color(0xFFAEAEAE),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
