import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'homepage.dart';

void main()async {
  List currencies =await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatefulWidget {
  final List _currencies;
  MyApp(this._currencies);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: debugDefaultTargetPlatformOverride == TargetPlatform.iOS?Colors.white:null
      ),
      home: Homepage(widget._currencies),
    );
  }
}

Future<List> getCurrencies()async{
  String cryptoUrl="https://api.nomics.com/v1/currencies/ticker?key=11051e8e1910208c4d959acbdba4752a&ids=BTC,ETH,XRP,USDT,BSV,BCH,BNB,XTZ,OKB,LINK,LTC,XLM,ADA,LEO,EOS,XMR,HT,TRX,DASH,USDC,CRO,ETC,NEO,ATOM,IOTA,ZEC,XEM,FTT,PAX,ONT,DOGE,VET,BAT,BUSD,BTG,LSK,DCR,ALGO,QTUM,TUSD,ICX,HBAR,DGB,MWC,REP,ZRX,ENJ,BTM,RVN,NMR,WAVES,BCD,THETA,DAI,MONA,GT,OMG,KNC&interval=1d,7d&convert=USD";
  http.Response response= await http.get(cryptoUrl);

  return jsonDecode(response.body);

}