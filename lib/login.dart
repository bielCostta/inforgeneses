import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
const api = 'http://bielapp.tecnologia.ws/json_retorno.php';

class login{
  final String usuario;
  login({this.usuario});




}

Future<dynamic> getData() async{
  http.Response response = await http.get(api);
  return json.decode(response.body);
}

