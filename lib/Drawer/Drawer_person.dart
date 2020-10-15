import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inforgeneses/CARRINHO_COMPRAS/Carrinho.dart';


class Drawer_personalizado extends StatelessWidget {
  String usuario;
  String email;
  String nome;

  Drawer_personalizado({this.usuario,this.email,this.nome});

  final GlobalKey<ScaffoldState> key_Drawer = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    //=================== VARIAVEIS LOBAIS =============
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    Color azul = Colors.lightBlue; //COR AZUL DO TEMA
    Color branco = Colors.white; //COR BRANCA DO TEMA
    Color azul_cinza = Colors.blueGrey; //COR BRANCA DO TEMA


    return Drawer(

      child: Column(

        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: azul,
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              currentAccountPicture: CircleAvatar(
                backgroundColor: branco,
                child: Text("${nome[0].toUpperCase()}",style: TextStyle(fontSize: 30),),
              ),
              accountName: Container(
                child: Text("$usuario",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              accountEmail: Container(
                child: Text("$email",style: TextStyle(color: Colors.white,fontSize: 13),),
              ),
            ),
          ),
          ListTile(
            onTap: (){
            Navigator.pop(context,MaterialPageRoute(
            builder: (context) => Drawer_personalizado(

            )));
            },
            leading: Icon(Icons.auto_stories,color: azul),
            title:  Text("Cursos",style: TextStyle(color: azul,fontSize: 16),textAlign: TextAlign.start,),
),//CURSOS
          ListTile(
            hoverColor: branco,
            focusColor: branco,
            selectedTileColor: branco,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Carrinho()
              )
              );
            },
            leading: Icon(Icons.shopping_cart,color: azul),
            title:  Text("Carrinho de compras",style: TextStyle(color: azul,fontSize: 16),textAlign: TextAlign.start,),
            ),//CARRINHO DE COMPRAS
          ListTile(
            hoverColor: azul_cinza ,
            focusColor: azul_cinza,
            selectedTileColor: azul_cinza,
            onTap: () =>  Navigator.pop(context),
            leading: Icon(Icons.settings,color: azul),
            title:  Text("Confiurações",style: TextStyle(color: azul,fontSize: 16),textAlign: TextAlign.start,),
            ),//CONFIGURAÇÕES
        ],
      ),
    );
  }
}



// ListTile(
// onTap: (){
// Navigator.pop(context,MaterialPageRoute(
// builder: (context) => Drawer_personalizado(
//
// )));
// },
// leading: Icon(Icons.auto_stories,color: branco),
// title:  Text("Cursos",style: TextStyle(color: branco,fontSize: 16),textAlign: TextAlign.start,),
// ),
// ListTile(
// hoverColor: branco,
// focusColor: branco,
// selectedTileColor: branco,
// onTap: (){
// Navigator.pop(context);
// },
// leading: Icon(Icons.shopping_cart,color: branco),
// title:  Text("Carrinho de compras",style: TextStyle(color: branco,fontSize: 16),textAlign: TextAlign.start,),
// ),
// ListTile(
// hoverColor: branco,
// focusColor: branco,
// selectedTileColor: branco,
//
// leading: Icon(Icons.settings,color: branco),
// title:  Text("Confiurações",style: TextStyle(color: branco,fontSize: 16),textAlign: TextAlign.start,),
// ),