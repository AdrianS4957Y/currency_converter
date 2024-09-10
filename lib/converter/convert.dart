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

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CurrencyApi>(context, listen: false);
    from = Amount(provider.currencyList.first);
    to = Amount(provider.currencyList.last);
  }

  @override
  Widget build(BuildContext context) {
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
                  from.amount = double.parse(p0);
                  to.amount = from.convert(to.currency);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 15 / 703,
              ),
              child: Swap(
                onClick: (details) {
                  setState(() {
                    Amount temp = from;
                    from = to;
                    to = temp;
                  });
                },
              ),
            ),
            MoneyInput(
              header: "Converted Amount",
              amount: to,
              onChange: (p0) {
                setState(() {
                  to.amount = double.parse(p0);
                  from.amount = to.convert(from.currency);
                });
              },
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
