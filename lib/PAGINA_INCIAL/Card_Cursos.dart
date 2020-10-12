
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cards extends StatefulWidget {
  @override
  _cardsState createState() => _cardsState();

  cards({this.curso,this.categoria,this.imagem,this.preco,this.descricao,this.id});

  final String curso;
  final String categoria;
  final String imagem;
  final String preco;
  final String descricao;
  final String id;

}

class _cardsState extends State<cards> {


  @override
  Widget build(BuildContext context) {
//=================== VARIAVEIS LOBAIS =============
    double altura = MediaQuery.of(context).size.width;
    double largura = MediaQuery.of(context).size.height;

    Color azul    = Colors.lightBlue; //COR AZUL DO TEMA
    Color branco  = Colors.white;     //COR BRANCA DO TEMA

    String Curso      = widget.curso;
    String Categoria  =  widget.categoria;
    String Imagem     = widget.imagem;
    String preco      = widget.preco;
    String id         = widget.id;

    NetworkImage img = NetworkImage(Imagem);
//===================================================
    return Container(
        height: 124.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: new InkWell(
          splashColor: branco,
          hoverColor: branco,
          borderRadius: BorderRadius.circular(20),
          onTap: (){},
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 66),
                height: 124.0,
                margin: new EdgeInsets.only(left: 42.0),
                decoration: new BoxDecoration(
                  //border: Border.all(color: branco),
                  color: azul,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(Curso,textAlign: TextAlign.left,
                        style: TextStyle(
                            color: branco,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),),
                      subtitle: Text(Categoria,textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                        ),),
                    ),  //CURSO E CATEGORIA
                    Divider(
                      height: 0.1,
                      indent: largura/35,  //LOICA QUE DEFINE DISTANCIA DE ONDE COMEÇA O DIVIDER
                      endIndent: largura/6,//LOICA QUE DEFINE DISTANCIA DE ONDE TERMINA O DIVIDER
                      thickness: 1.5,
                      color: branco,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              //Icon(Icons.attach_money,color:azul,size: 14,),
                              Text("Preço: ",
                                style: TextStyle(
                                    color: branco,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),),
                              Text("$preco R\$",
                              style: TextStyle(
                              color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),)
                            ],
                          ),
                        )
                    ),

                  ],
                ),
              ),
              Container(
                  margin: new EdgeInsets.symmetric(
                      vertical: 10.0
                  ),
                  alignment: FractionalOffset.centerLeft,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue,Colors.indigo],
                              stops: [0.2,0.8]
                          ),
                          image: DecorationImage(
                              image: img,
                              fit: BoxFit.cover
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),

                      ),

                    ],
                  )
              ),//IMAGEM DA PEÇA
            ],
          ),
        )
    );
  }
}

