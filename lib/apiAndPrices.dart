import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = "069AB819-F5B8-4E09-B61A-B487CFAA9B94";
// https://rest.coinapi.io/v1/exchangerate/BTC/EUR?apikey=069AB819-F5B8-4E09-B61A-B487CFAA9B94

class getCurrenc{
  getCurrenc(this.currency);
  final String currency;

  Future<String> getPrice() async {
    // var url = Uri.parse(currency);
    // http.Response response = await http.get(url);
    // double value =  jsonDecode(response.body)['rate'] ;
    try{
      var url = Uri.parse(currency);
      http.Response response = await http.get(url);
      double value =  jsonDecode(response.body)['rate'] ;
      return value.toStringAsFixed(2);
    }
    catch(e){
      return 'ERROR';
    }
    // if(response.statusCode == 200){
    //   print(value.toStringAsFixed(2));
    //   return value.toStringAsFixed(2);
    // }
    // else{
    //   return 'ERROR';
    // }
  }

}