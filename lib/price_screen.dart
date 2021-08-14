import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'apiAndPrices.dart';
import 'coin_data.dart';
import 'package:bitcoin_ticker/apiAndPrices.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Exchange.dart';

const apikey1 = '8A594739-F853-4119-B2F9-D1387D8B1FC6';
const apikey = '069AB819-F5B8-4E09-B61A-B487CFAA9B94';
const apikey2 = 'DE14F982-2E17-49DA-9477-4CAFCB4C0E6F';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();

}

class _PriceScreenState extends State<PriceScreen> {

  @override

  String selectedCurrency = 'INR';
  String curempty = 'INR';
  List<String> values = [];
  int listIndex = 0;
  String valuea = " ";
  String valueE = " ";
  String valueL = " ";
  String valueD =" ";


  void initState() {
    // TODO: implement initState
    super.initState();
    getEverything();
  }
  @override

  void getEverything(){
    getC(Curemptyy: curempty);
    getL(Curemptyy: curempty);
    getE(Curemptyy: curempty);
    getD(Curemptyy: curempty);
  }


  List<DropdownMenuItem<String>> getCurrency(){
    List<DropdownMenuItem<String>> CurrencyList = [];
    for(String currency in currenciesList){
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      CurrencyList.add(newItem);
    }
    return CurrencyList;
  }

  List<Text> Currencytios(){
   List<Text> currencyIOS = [];
   for(String currency in currenciesList){
     var newItem = Text(currency,
     style: TextStyle(
       color: Colors.white
     ),);
     currencyIOS.add(newItem);
   }
   return currencyIOS;
  }

  Future <void> getC({String Curemptyy = 'INR'}) async{
      getCurrenc gtCurrency =  getCurrenc("https://rest.coinapi.io/v1/exchangerate/BTC/$Curemptyy?apikey=$apikey");
      valuea = await gtCurrency.getPrice();
      setState(()  {
        valuea = valuea;
      });


  }
  Future <void> getE({String Curemptyy = 'INR'}) async{
    getCurrenc gtCurrency =  getCurrenc("https://rest.coinapi.io/v1/exchangerate/ETH/$Curemptyy?apikey=$apikey");
    valueE = await gtCurrency.getPrice();
    setState(() {
      valueE = valueE;
    });
  }
  Future <void> getD({String Curemptyy = 'INR'}) async{
    getCurrenc gtCurrency =  getCurrenc("https://rest.coinapi.io/v1/exchangerate/DOGE/$Curemptyy?apikey=$apikey");
    valueD = await gtCurrency.getPrice();
    setState(() {
      valueD = valueD;
    });
  }

  Future <void> getL({String Curemptyy = 'INR'}) async{
    getCurrenc gtCurrency =  getCurrenc("https://rest.coinapi.io/v1/exchangerate/LTC/$Curemptyy?apikey=$apikey");
    valueL = await gtCurrency.getPrice();
    setState(() {
      valueL = valueL;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Crypto Value'),
            FloatingActionButton(
              child: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: (){
                setState(() {
                  getEverything();
                });
              },
              backgroundColor: Colors.transparent,
            )
          ],
        ),
        backgroundColor: Colors.black,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/aab.png'),
                fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        //color: Colors.white,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.grey.withOpacity(0.5),
                          //   spreadRadius: 3,
                          //   blurRadius: 20,
                          //   offset: Offset(0.0, 2), // changes position of shadow
                          // ),
                        ],
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset('lib/assets/BTC.svg',),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BTC : $valuea",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 20.0 ,
                                color: Colors.white,
                              ),
                            ),
                            Text('$curempty',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Expanded(
                      child: Container(

                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 3,
                          //     blurRadius: 20,
                          //     offset: Offset(0.0, 2), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('lib/assets/ETH.svg',),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ETH : $valueE',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text('$curempty',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),)
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Expanded(
                      child: Container(

                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 3,
                          //     blurRadius: 20,
                          //     offset: Offset(0.0, 2), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('lib/assets/LTC.svg',),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('LTC  : $valueL',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text('$curempty',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),)
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            // BoxShadow(
                            //   color: Colors.grey.withOpacity(0.5),
                            //   spreadRadius: 3,
                            //   blurRadius: 20,
                            //   offset: Offset(0.0, 2), // changes position of shadow
                            // ),
                          ],
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('lib/assets/BNB.svg',),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("BNB : $valueD",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 20.0 ,
                                  color: Colors.white,
                                ),
                              ),
                              Text('$curempty',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),)
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ],
            )
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(onPressed: (){
                      print("pressed");
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return exchage();
                          }
                      )
                          );
                    },
                        child:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('CRYPTO EXCHANGE  ',style: TextStyle(
                                fontSize: 15 ,
                                color: Colors.white
                              ), ),
                              Icon(
                                Icons.arrow_right_alt_sharp,
                                size: 35,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ) ),
                  ),
                ),
                SizedBox(
                  height: 100,

                ),
                Center(
                  child: Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 10.0),
                    color: Colors.transparent,
                    child:
                    Center(
                      child: CupertinoPicker(
                        useMagnifier: true,
                        looping: true,
                        magnification: 1.2,
                        itemExtent: 35.0,
                        onSelectedItemChanged: (selectedCurrency){
                          setState(() {
                            curempty = currenciesList[selectedCurrency];
                            print(curempty);
                            getC(Curemptyy: curempty);
                            getE(Curemptyy: curempty);
                            getL(Curemptyy: curempty);
                          });
                        },
                        children: Currencytios(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// DropdownButton<String>(
// value: selectedCurrency,
// items: getCurrency(),
// onChanged: (value){
// setState(() {
// selectedCurrency = value;
// });
// },
// )

// Padding(
// padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
// child: Card(
// color: Colors.lightBlueAccent,
// elevation: 5.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
// child: Text("BTC : $valuea",
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0 ,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
// child: Card(
// color: Colors.lightBlueAccent,
// elevation: 5.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
// child: Text('ETH : $valueE',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
// child: Card(
// color: Colors.lightBlueAccent,
// elevation: 5.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
// child: Text('LTC : $valueL',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),