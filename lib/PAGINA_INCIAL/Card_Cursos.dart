
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

    String Curso      = widget.curso;
    String Categoria  =  widget.categoria;
    String Imagem     = widget.imagem;
    String preco      = widget.preco;
    String id         = widget.id;



    NetworkImage img = NetworkImage(Imagem);

    return Container(
        height: 124.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: new InkWell(
          splashColor: Colors.indigoAccent,
          hoverColor: Colors.indigo,
          borderRadius: BorderRadius.circular(20),
          onTap: (){},
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 66),
                height: 124.0,
                margin: new EdgeInsets.only(left: 42.0),
                decoration: new BoxDecoration(
                  color: new Color.fromRGBO(44, 44, 98, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
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
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22
                        ),),
                      subtitle: Text(Categoria,textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                        ),),
                    ),  //PEÇA E CLIENTE
                    Divider(
                      height: 0.1,
                      indent: 20,
                      endIndent: 150,
                      thickness: 1.5,
                      color: Colors.blue,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.print,color:Colors.grey,size: 20,),
                              Text(preco,style: TextStyle(color: Colors.grey),),
                              Icon(Icons.date_range,color:Colors.grey,size: 20,),
                              Text(id,style: TextStyle(color: Colors.grey),)
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
                        width: 105,
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
                            color: Colors.blue,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(70),
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

