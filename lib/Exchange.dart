import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coin_data.dart';
import 'networkCalculation.dart';

class Exchange{
  Exchange();
}

class exchage extends StatefulWidget {

  @override
  _exchageState createState() => _exchageState();
}


class _exchageState extends State<exchage> {
  @override

  String selectedCryptofirst = 'BTC';
  String firstValue = '0';
  double firstnum = 0;
  String selectedCryptosecond = 'BTC';
  String secondValue = '0';
  double secondnum = 0;
  String ans = '0';


  Future<void> getEx() async{
    networkCalculation network = networkCalculation(firstnum, selectedCryptofirst, selectedCryptosecond);
    ans = await network.getExchange();
    setState(() {
      ans = ans;
    });
  }



  List<DropdownMenuItem<String>> getCoins(){
    List<DropdownMenuItem<String>> CoinList= [];
    for(String currency in cryptoList){
      var newItem = DropdownMenuItem(
        child: Text(currency,
        style: TextStyle(
          color: Colors.black
        ),),
        value: currency,
      );
      CoinList.add(newItem);
    }
    return CoinList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)  , bottomLeft :Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10)  , bottomLeft: Radius.circular(10)),
                              borderSide: BorderSide.none
                            ),
                            hintText: 'Value',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )
                          ),
                          onSubmitted: (value){
                            setState(() {
                              firstValue = value;
                              firstnum = double.parse(value);
                              print(firstnum);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10)  , bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                          size: 35,
                        ),
                        dropdownColor: Colors.blue,
                        value: selectedCryptofirst,
                        items: getCoins(),
                        onChanged: (value){
                          setState(() {
                            selectedCryptofirst = value;
                            print(selectedCryptofirst);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(child: Text('is',
              style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1.5
                    ..color = Colors.blue[100],
                fontSize: 25,
                fontWeight: FontWeight.w600
              ),)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 18.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)  , bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(ans,
                          textAlign: TextAlign.left,
                          style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),),
                      ),
                    ),
                    // child: TextField(
                    //   readOnly: true,
                    //   keyboardType: TextInputType.number,
                    //   style: TextStyle(
                    //       color: Colors.black
                    //   ),
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.only(topLeft: Radius.circular(10)  , bottomLeft: Radius.circular(10)),
                    //           borderSide: BorderSide.none
                    //       ),
                    //       hintText: ans,
                    //       hintStyle: TextStyle(
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //       )
                    //   ),
                    //   onSubmitted: (value){
                    //     setState(() {
                    //       secondValue = value;
                    //      secondnum= double.parse(value);
                    //       print(secondnum);
                    //     });
                    //   },
                    // ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10)  , bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                          size: 35,
                        ),
                        dropdownColor: Colors.blue,
                        value: selectedCryptosecond,
                        items: getCoins(),
                        onChanged: (value){
                          setState(() {
                            selectedCryptosecond = value;
                            print(selectedCryptosecond);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(onPressed: (){
                  print("pressed2");
                  setState(() {
                    getEx();
                  });
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
          ],
        ),
      ),
    );
  }
}