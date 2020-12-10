import 'package:flutter/material.dart';
import 'coin_data.dart';

List<DropdownMenuItem> loop(){
  List<DropdownMenuItem<String>> dropDown=[];
  for(int i=0;i<currenciesList.length;i++){
    String a=currenciesList[i];
    var x=DropdownMenuItem(
      child: Text(a),
      value:a,
    );
    dropDown.add(x);

  }
  return dropDown;
}