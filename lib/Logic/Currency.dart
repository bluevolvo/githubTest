import 'package:http/http.dart';
import 'dart:convert';




class GetData{
  var _data;
  Future httpRequest (String selectedCurrency) async{
    var url = Uri.parse("https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=27D6E83A-A648-4669-901E-89BBB9A4747F#");
    Response response =await get(url);
    _data =response.body;
   return jsonDecode(_data);

}
}
