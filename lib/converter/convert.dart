import 'package:currency_converter/api/amount.dart';
import 'package:currency_converter/api/currency_api.dart';
import 'package:currency_converter/converter/change_rate.dart';
import 'package:currency_converter/converter/money_input.dart';
import 'package:currency_converter/converter/swap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Convert extends StatefulWidget {
  const Convert({
    super.key,
  });

  @override
  ConvertState createState() => ConvertState();
}

class ConvertState extends State<Convert> {
  late Amount from;
  late Amount to;
  late CurrencyApi provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<CurrencyApi>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    from = provider.first!;
    to = provider.second!;
    to.amount = from.convert(to.currency);
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            // SizedBox(
            //     height: MediaQuery.of(context).size.height * 110 / 703,
            //     ),
            MoneyInput(
              header: "Amount",
              amount: from,
              onChange: (p0) {
                setState(() {
                  provider.first!.amount = double.parse(p0);
                  provider.second!.amount =
                      provider.first!.convert(provider.second!.currency);
                });
              },
              selected: [from.currency, to.currency],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 15 / 703,
              ),
              child: Swap(
                onClick: (details) {
                  setState(() {
                    provider.changeCurrencies(to, from);
                    // Amount temp = from;
                    // from = to;
                    // to = temp;
                  });
                },
              ),
            ),
            MoneyInput(
              header: "Converted Amount",
              amount: to,
              onChange: (p0) {
                setState(() {
                  provider.second!.amount = double.parse(p0);
                  provider.first!.amount =
                      provider.second!.convert(provider.first!.currency);
                });
              },
              selected: [from.currency, to.currency],
            ),
            ChangeRate(
              first: from,
              second: to,
            ),
          ],
        ),
      ),
    );
  }
}
