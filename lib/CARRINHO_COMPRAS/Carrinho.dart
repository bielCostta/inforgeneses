import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    //=================== VARIAVEIS LOBAIS =============
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    Color azul    = Colors.lightBlue; //COR AZUL DO TEMA
    Color branco  = Colors.white;     //COR BRANCA DO TEMA


    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ) ,
      ),
    );
  }
}
