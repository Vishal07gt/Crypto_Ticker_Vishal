import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
class networkCalculation{
  networkCalculation(this.first,this.firstSelected,this.secondSelected);
  final double first ;
  final String firstSelected ;
  final String secondSelected ;

  Future<String> getExchange() async {
    try{
      var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');
      http.Response response = await http.get(url);
      //print(response.body);
      var num1C = jsonDecode(response.body)['rates'][firstSelected.toLowerCase()]['value'];
      print(num1C);
      var num2C = jsonDecode(response.body)['rates'][secondSelected.toLowerCase()]['value'];
      print(num2C);
      print(num1C.runtimeType);
      double ans = (num1C * first) * (num2C);
      print(ans);
      return ans.toStringAsFixed(4);
    }
    catch(e){
      return 'ERROR';
    }
  }


}