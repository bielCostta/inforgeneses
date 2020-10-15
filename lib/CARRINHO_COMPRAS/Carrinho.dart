import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inforgeneses/CARRINHO_COMPRAS/Card_carrinho.dart';
import 'package:inforgeneses/PAGINA_INCIAL/Card_Cursos.dart';


class Carrinho extends StatefulWidget {
  String descricao;
  String imagem;
  String categoria;
  String id;
  String curso;
  String preco;
  Carrinho({this.id,this.curso,this.preco,this.descricao,this.imagem,this.categoria});


  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {


  @override
  Widget build(BuildContext context) {
    var descricao = widget.descricao;
    String imagem = widget.descricao;
    var categoria = widget.descricao;
    String id = widget.descricao;
    String curso = widget.descricao;
    String preco = widget.descricao;

    //=================== VARIAVEIS LOBAIS =============
    double altura = MediaQuery
        .of(context)
        .size
        .height;
    double largura = MediaQuery
        .of(context)
        .size
        .width;

    Color azul = Colors.lightBlue; //COR AZUL DO TEMA
    Color branco = Colors.white; //COR BRANCA DO TEMA


    return Scaffold(
        backgroundColor: azul,
        appBar: AppBar(
          centerTitle: true,
          title:  Text('Carrinho de compras', style: TextStyle(color: azul)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // FutureBuilder(
              //
              //     builder: (context,id){
              //
              // }),

            ],
          )
        )
    );
  }
}
