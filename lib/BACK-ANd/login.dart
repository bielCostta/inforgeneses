import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inforgeneses/PAGINA_INCIAL/Pagina_inicial.dart';
import 'dart:convert';
const api = 'http://bielapp.tecnologia.ws/json_retorno.php';



class Login extends StatelessWidget {
  final String usuario, senha;
  Login({this.usuario,this.senha});

  @override
  Widget build(BuildContext context) {
     // buscar();
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

  }









}







