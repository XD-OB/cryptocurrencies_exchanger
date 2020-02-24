import 'package:flutter/material.dart';
import 'constants.dart';

class CurrencyCard extends StatelessWidget {
  final String    cryptoCurrency;
  final String    value;
  final IconData  icon;

  CurrencyCard({this.icon, this.cryptoCurrency, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 3.0, 18.0, 0),
      child: Card(
        color: kColorElts,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Row(
            children: <Widget>[
              Icon(icon),
              Text(
                '  $cryptoCurrency'
              ),
              Container(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}