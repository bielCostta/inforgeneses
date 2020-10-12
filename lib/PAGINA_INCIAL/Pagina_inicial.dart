import 'dart:convert';
import 'dart:io';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:inforgeneses/BACK-ANd/Card_JSON.dart';
import 'package:inforgeneses/BACK-ANd/CARD_API.dart';
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

  int ID = 0;

DadosGerais_Cursos() async {
    http.Response GeralCursos = await http.get(apiGeralCursos);
    if(GeralCursos.statusCode == 200){
      var gera = json.decode(GeralCursos.body);
      int retorno = int.parse(gera[0]["Qtd_cursos"].toString());

      this.ID = retorno;
    }else{
      print('erro');
    }



  }

  @override
  Widget build(BuildContext context) {
    DadosGerais_Cursos();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(backgroundColor: Colors.lightBlue),
      drawer: Drawer(

      ),
      body: FutureBuilder<List<Cards>>(
        future: cursos_lista().decode(),
        builder: (context,snapshot){
          switch(snapshot.connectionState) {
            case ConnectionState.waiting: return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );              //widget para quando tiver carreando
            case ConnectionState.none: return Center(
                child: Text(
                  'Sem Conexão', style: TextStyle(color: Colors.white),),
              );               //Widget para quando não tiver dados
            case ConnectionState.done: return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, ID) {
                    return cards(
                      curso:      "${snapshot.data[ID].curso}",
                      categoria:  "${snapshot.data[ID].categoria}",
                      imagem:     "${snapshot.data[ID].imagem}",
                      preco:      "${snapshot.data[ID].preco}",
                      descricao:  "${snapshot.data[ID].descricao}",
                      id:         "${snapshot.data[ID].id}",
                    );
                  }
              );    // Widget que mostra os cards dos cursos
            default:  return Center(
                child: Text(
                  'Sem Conexão', style: TextStyle(color: Colors.white),),
              );
          }
        },
      )
    );
  }


}

