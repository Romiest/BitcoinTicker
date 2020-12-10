
import 'package:bitcoin_ticker/Currency.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'DropDown.dart';



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency='USD';
String sign1='?';
String sign2='?';
String sign3='?';

  void updateUI()async {
 CoinData coinData=CoinData();
 var data=await coinData.getCoinData(cryptoList[0],selectedCurrency);
 var data1=await coinData.getCoinData(cryptoList[1],selectedCurrency);
 var data2=await coinData.getCoinData(cryptoList[2],selectedCurrency);
 setState(() {
   sign1=data.toStringAsFixed(0);
   sign2=data1.toStringAsFixed(0);
   sign3=data2.toStringAsFixed(0);

 });



  }
@override
  void initState() {
    super.initState();
    updateUI();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Currency(base:cryptoList[0] ,
          rate: sign1,
            quote: selectedCurrency,
          ),
          Currency(
            base:cryptoList[1] ,
            rate: sign2,
            quote: selectedCurrency,
          ),
          Currency(
            base: cryptoList[2],
            rate: sign3,
            quote: selectedCurrency,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items:loop(),
              onChanged: (value){
                setState(() {
                  sign1='?';
                  sign2='?';
                  sign3='?';
                  updateUI();
                  selectedCurrency=value;
                });
              }

              ,


            ),
          ),
        ],
      ),
    );
  }
}


