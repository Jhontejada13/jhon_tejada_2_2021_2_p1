import 'dart:convert';

import 'package:partial1_elephantapp/models/elephant.dart';
import 'package:partial1_elephantapp/models/response.dart';
import 'package:http/http.dart' as http;

class ApiHelper{

  static Future<Response> getElephants() async {
      var url = Uri.parse("https://elephant-api.herokuapp.com/elephants");
      var response = await http.get(
        url,
        headers: {
          'content-type' : 'application/json',
          'accept' : 'application/json',
        }
      );

      var body = response.body;

    if(response.statusCode >= 400){
      return Response(isSucces: false, message: body);
    }

    List<Elephant> list = [];
    var decodedJson = jsonDecode(body);
    if(decodedJson != null) {
      for (var item in decodedJson) {
        list.add(Elephant.fromJson(item));
      }
    }

    return Response(isSucces: true, result: list);
  }

}