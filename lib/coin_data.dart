import 'package:http/http.dart';
import 'dart:convert';



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

Future getCoinData(String base,String quote)async{
  var response=await get('https://rest.coinapi.io/v1/exchangerate/$base/$quote?apikey=7B65843BE7714241A2876852956A47BE');
  if(response.statusCode==200) {
    var data = response.body;
    var lastPrice=jsonDecode(data)['rate'];

print(response.statusCode);
    return lastPrice;

  }
  else {
    print(response.statusCode);

    print(response.statusCode);
  }
}



}
