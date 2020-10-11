import 'dart:convert';
import 'dart:io';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:inforgeneses/BACK-ANd/login.dart';
import 'package:inforgeneses/PAGINA_INCIAL/Card_Cursos.dart';
import 'package:http/http.dart' as http;
const api_cursos = 'http://bielapp.tecnologia.ws/json_retorno_Cursos.php';
const api_geral_cursos = "http://bielapp.tecnologia.ws/json_retorno_GeralCursos.php";

class Pagina_inicial extends StatefulWidget {
  String nome,usuario,email;

  Pagina_inicial({
    this.nome,
    this.usuario,
    this.email,
  }
);

  @override
  _Pagina_inicialState createState() => _Pagina_inicialState();
}





class _Pagina_inicialState extends State<Pagina_inicial> {
  int ID; //VALOR DE QUANTOS CARDS VAI SER CRIADO PUXADO PELA API

  Future<int> percorrer() async {
    int i = 0; // Variavel que percorre json
    http.Response response = await http.get(api_cursos); //conecta com a API
    http.Response geral = await http.get(api_geral_cursos);

    for(i; i<=ID; i++){
      return json.decode(response.body)[i]["id"];
    }

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(),
      drawer: Drawer(),
      body: FutureBuilder<int>(
        future: ,
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }else{
            return ListView.builder(
                itemCount: ID,
                itemBuilder: (context, ID){
                  return cards(
                    curso: "curso "+"",
                    categoria: "categoria",
                    imagem: "imagem",
                    preco: "peco",
                    descricao: "descricao",
                    id: "ID",
                  );
                }
            );


          }
        },
      )
    );
  }


}

