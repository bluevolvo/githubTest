import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin4real/Logic/Currency.dart';
import 'package:bitcoin4real/Logic/ListTileLogic.dart';
import 'package:intl/intl.dart';


class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  List<Logic> currencies= [
    Logic(short: "USD", country: "United States of America",flag: "images/usa.jpg" ),
    Logic(short: "CAD", country: "Canada", flag: "images/can.jpg" ),
    Logic(short: "AUD", country:"Australia",flag: "images/aud.jpg"  ),
    Logic(short: "GHS", country:"Ghana",flag: "images/gh.jpg"  ),
  ];

  double usd;
  var ddv ="USD";
  int fff;
  final money =  NumberFormat("#,##0.00", "en_US");




  @override
  void initState() {
    super.initState();
    httpRequest();

  }

  GetData getData = GetData();
  void httpRequest ()async {
   var data = await getData.httpRequest(ddv);
  setState(() {
    usd = data["rate"];


  });
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                child: Column(
                  children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                             margin: EdgeInsets.symmetric(vertical: 50),
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.purple, Colors.deepOrangeAccent]
                      ),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("BTC to $ddv",style: TextStyle(color: Colors.white, fontSize: 20)),
                                  Divider(height: 1,thickness: 0.5, color: Colors.white,endIndent: 100,indent: 100,),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(usd.toString(), style: TextStyle(color: Colors.white,fontSize: 70),),
                                  )
                                ],
                              ),
                       ),
                          ),
                    Expanded(
                      child: ListView.separated(
                          itemCount: currencies.length,
                          separatorBuilder: (context, index) => Divider(height: 2,thickness:0.5,color: Colors.grey,),
                          itemBuilder: (context, index){
                        return ListTile(
                          onTap: (){
                            setState(() {
                              ddv= currencies[index].short;
                              httpRequest();
                            });
                          },
                          title: Text(currencies[index].short,style: TextStyle(color: Colors.white),),
                          subtitle: Text(currencies[index].country,style: TextStyle(color: Colors.white)),
                          leading:CircleAvatar(maxRadius:15,backgroundImage:AssetImage(currencies[index].flag),) ,

                        );
                          }
                        ),
                    )
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
