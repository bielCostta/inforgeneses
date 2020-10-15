import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inforgeneses/CARRINHO_COMPRAS/Carrinho.dart';

class detalhes extends StatefulWidget {
  final String curso;
  final String categoria;
  final String imagem;
  final String preco;
  final String descricao;
  final String id;
 detalhes({this.curso,this.categoria,this.imagem,this.preco,this.descricao,this.id});


  @override
  _detalhesState createState() => _detalhesState();
}

class _detalhesState extends State<detalhes> {
  @override
  Widget build(BuildContext context) {

    //=================== VARIAVEIS LOBAIS =============
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    Color branco  = Colors.white;     //COR BRANCA DO TEMA
    Color cinza    = Colors.blueGrey; //COR AZUL DO TEMA
    Color azul    = Colors.lightBlue; //COR AZUL DO TEMA


    return Scaffold(
      backgroundColor: azul,
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 10),
            child:Text("${widget.preco},00 R\$ ",style: TextStyle(color: branco,fontSize: 18),textAlign: TextAlign.center,),
          ),
        ],
        backgroundColor: azul,
        title: Text("${widget.curso}",style: TextStyle(color: branco),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: altura/2.5),
            color: azul,
            height: altura,
            width: largura,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 70),
              child:  Column(
                children: [
                  Container(
                    height: 40,
                    child:  Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      padding: EdgeInsets.only(left:10),
                      child:Text("${widget.curso}",textAlign: TextAlign.center,
                        style:TextStyle(
                          color: branco,
                          fontSize: 20,
                        ),),
                    ),
                    ),
                   //NOME DO CUROS
                  Divider(
                    height: 0.1,
                    indent: 30,  //LOICA QUE DEFINE DISTANCIA DE ONDE COMEÇA O DIVIDER
                    endIndent: 30,//LOICA QUE DEFINE DISTANCIA DE ONDE TERMINA O DIVIDER
                    thickness: 1.5,
                    color: branco,
                  ),
                  Container(

                    padding: EdgeInsets.all(10),
                    child:Row(
                      children: [
                        Text("Categoria:  ",style:TextStyle(
                          color: branco,
                          fontSize: 16,
                        ),),
                        Text("${widget.categoria}",style: TextStyle(color: branco))

                      ],
                    ),), //CATEGORIA
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left:10),
                        child:Text("Descrição: ",textAlign: TextAlign.left,
                          style:TextStyle(
                            color: branco,
                            fontSize: 16,
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        constraints: BoxConstraints(maxWidth: 200),
                        child:Text("${widget.descricao} ",style: TextStyle(color: branco)),
                      ),


                    ],
                  ),//DESCRIÇÃO DOS CURSOS
                ],
              ),
            )
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: branco),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${widget.imagem}")
                ),
                color: branco,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(0,100),
                    bottomRight: Radius.elliptical(70, 60))
            ),
            height: altura/2.7,
            width: largura,
          ), //IMAGEM


        ],
      ),
      floatingActionButton:  FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey,
        foregroundColor: branco,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Carrinho()
          )
          );
        },
        label: Text('Adicionar ao Carrinho',style: TextStyle(
          fontSize: 12
        ),),
        icon: Icon(Icons.add_shopping_cart_rounded,size: 18,),
      ),
    );

  }
}
