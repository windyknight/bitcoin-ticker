import 'dart:convert';
import 'package:http/http.dart' as http;


const String apikey = 'B05E4C4D-AC7B-4EEB-8DC1-69D23EE061E4';
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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static Future<Map<String, double>> getRates(String currency) async {
    http.Response resBtc, resEth, resLtc;
    resBtc = await http.get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apikey"));
    resEth = await http.get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apikey=$apikey"));
    resLtc = await http.get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apikey=$apikey"));

    return {
      'BTC' : jsonDecode(resBtc.body)['rate'],
      'ETH' : jsonDecode(resEth.body)['rate'],
      'LTC' : jsonDecode(resLtc.body)['rate'],
    };
  }
}
