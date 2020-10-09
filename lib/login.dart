import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
const api = 'http://bielapp.tecnologia.ws/json_retorno.php';



class Login{
  final String usuario, senha;



  Login({this.usuario,this.senha});

  void buscar() async{
    int i = 0;
    var id;
    http.Response response = await http.get(api);

    do {
      id = json.decode(response.body)[i]['login'];
      if(id == usuario){
        break;
      }
      print(id);
      i++;
    }while( id != this.usuario);





  }
}








