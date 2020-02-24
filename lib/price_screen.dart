import 'package:bitcoin_ticker/currency_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'currency_card.dart';
import 'currency_type.dart';
import 'coin_data.dart';
import 'constants.dart';
import 'dart:io' show Platform;

String selectedCurrency = 'USD';
List<String> values = ['?', '?', '?', '?', '?'];
int amount = 1;
var cryptoData;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  @override
  void initState() {
    super.initState();
    refreshPage();
  }

  void refreshPage() async {
    cryptoData = await Crypto().getData(selectedCurrency);
    setState(() => updateValues());
  }

  void updateValues() {
    if (cryptoData != null) {
      double tmp;
      tmp = double.parse(cryptoData[kBTC]['price']);
      values[kBTC] = (tmp * amount).toStringAsFixed(2);
      if (values[kBTC].length > 14)
        values[kBTC] = 'Over Max length';
      tmp = double.parse(cryptoData[kETH]['price']);
      values[kETH] = (tmp * amount).toStringAsFixed(2);
      if (values[kETH].length > 14)
        values[kETH] = 'Over Max length';
      tmp = double.parse(cryptoData[kXRP]['price']);
      values[kXRP] = (tmp * amount).toStringAsFixed(2);
      if (values[kXRP].length > 14)
        values[kXRP] = 'Over Max length';
      tmp = double.parse(cryptoData[kLTC]['price']);
      values[kLTC] = (tmp * amount).toStringAsFixed(2);
      if (values[kLTC].length > 14)
        values[kLTC] = 'Over Max length';
      tmp = double.parse(cryptoData[kXMR]['price']);
      values[kXMR] = (tmp * amount).toStringAsFixed(2);
      if (values[kXMR].length > 14)
        values[kXMR] = 'Over Max length';
    }
  }

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) => setState(() {
        values = ['?','?','?','?','?'];
        selectedCurrency = value;
        refreshPage();
      }),
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> listItems = [];

    for (String currency in currenciesList) listItems.add(Text(currency));
    return CupertinoPicker(
      itemExtent: 32.0,
      backgroundColor: kColorElts,
      children: listItems,
      onSelectedItemChanged: (selectedIndex) => setState(() {
        selectedCurrency = currenciesList[selectedIndex];
        values = ['?','?','?','?','?'];
        refreshPage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CurrencyCard(
                cryptoCurrency: 'BTC',
                value: values[kBTC],
                icon: CryptoFontIcons.BTC,
              ),
              CurrencyCard(
                cryptoCurrency: 'ETH',
                value: values[kETH],
                icon: CryptoFontIcons.ETH,
              ),
              CurrencyCard(
                cryptoCurrency: 'XRP',
                value: values[kXRP],
                icon: CryptoFontIcons.XRP,
              ),
              CurrencyCard(
                cryptoCurrency: 'LTC',
                value: values[kLTC],
                icon: CryptoFontIcons.LTC,
              ),
              CurrencyCard(
                cryptoCurrency: 'XMR',
                value: values[kXMR],
                icon: CryptoFontIcons.XMR,
              ),
              CurrencyType(
                currency: selectedCurrency,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 40.0, left: 10.0),
            child: TextField(
              onChanged: (value) {
                try {
                  int nbr = int.parse(value);
                  amount = nbr;
                } catch(e) {
                  print(e);
                }
                setState(() => updateValues());
              },
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                filled: true,
                fillColor: Colors.grey[600],
                hintText: 'Put a number',
              ),
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: kColorElts,
            child: Platform.isAndroid ? androidPicker() : iosPicker(),
          ),
        ],
      ),
    );
  }
}
