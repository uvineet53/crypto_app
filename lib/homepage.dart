
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final List currencies;
  Homepage(this.currencies);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.red,Colors.green,Colors.brown,Colors.teal,Colors.orange,Colors.cyan,Colors.pink,Colors.green,Colors.yellow,];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("CryptoApp"),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: _cryptoWidget());
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                itemCount: widget.currencies.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map currency=widget.currencies[index];
                  final MaterialColor colors= _colors[index%_colors.length];
                  return _getListItemUI(currency,colors);

                }),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUI(Map currency,MaterialColor color){
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency["name"][0],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      title: Text(currency['name'],style: TextStyle(
        fontWeight: FontWeight.bold
      ),),
      subtitle:_getSubtitleText(currency["price"],currency["1d"]["price_change_pct"]),
      isThreeLine: true,
    );

  }

  Widget _getSubtitleText(String price,String pct){
    TextSpan priceTextWidget= TextSpan(
      text: "Price: \$$price\n",style: TextStyle(
      color: Colors.black
    )
    );
    String pctChange="1 day : $pct %";
    TextSpan pctChangeWidget;
    if(double.parse(pct)>0){
      pctChangeWidget=TextSpan(
        text: pctChange,
        style: TextStyle(color: Colors.green)
      );
    }
    else{
      pctChangeWidget=TextSpan(
          text: pctChange,
          style: TextStyle(color: Colors.red)
      );
    }
    return RichText(
      text: TextSpan(
        children: [priceTextWidget,pctChangeWidget]
      )
    );

  }

}
