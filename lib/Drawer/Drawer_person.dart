import 'dart:math';

import 'package:flutter/material.dart';


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



    return Drawer(
key: key_Drawer,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius:  BorderRadius.only(topRight: Radius.circular(100)),
            ),

            accountName: Text("$usuario",style: TextStyle(color: branco),), //nome de usuario
            accountEmail: Text("$email",style: TextStyle(color: branco),),//E-mail
            currentAccountPicture: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: branco,
                child: Text("${nome[0].toUpperCase()}",style: TextStyle(fontSize: 30),),
              ),
            ),//Imagem do Usuario
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context,MaterialPageRoute(
                  builder: (context) => Drawer_personalizado(

                  )));
            },
            leading: Icon(Icons.auto_stories,color: branco),
            title:  Text("Cursos",style: TextStyle(color: branco,fontSize: 16),textAlign: TextAlign.start,),
          ),
          ListTile(
            hoverColor: branco,
            focusColor: branco,
            selectedTileColor: branco,
            onTap: (){
              Navigator.pop(context);
            },
            leading: Icon(Icons.shopping_cart,color: branco),
            title:  Text("Carrinho de compras",style: TextStyle(color: branco,fontSize: 16),textAlign: TextAlign.start,),
          ),
          ListTile(
            hoverColor: branco,
            focusColor: branco,
            selectedTileColor: branco,

            leading: Icon(Icons.settings,color: branco),
            title:  Text("Confiurações",style: TextStyle(color: branco,fontSize: 16),textAlign: TextAlign.start,),
          )
        ],
      ),
    );
  }
}
