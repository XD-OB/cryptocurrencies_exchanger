import 'package:flutter/material.dart';

const Color   kColorElts = Color(0xFF555555);
const String  kMainCurrencies = 'BTC,ETH,XRP,LTC,XMR';
const String  apiServer = 'https://api.nomics.com/v1/currencies/ticker';
const String  apiKey = '37f212063d3d967e88e216cac9353131';
const int     kBTC = 0;
const int     kETH = 1;
const int     kXRP = 2;
const int     kLTC = 3;
const int     kXMR = 4;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'MAD'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'XRP',
  'LTC',
  'XMR',
];