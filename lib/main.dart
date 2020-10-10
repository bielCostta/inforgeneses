
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'file:///C:/Users/Gabriel/StudioProjects/inforgeneses/lib/BACK-ANd/login.dart';
import 'package:http/http.dart' as http;
import 'package:inforgeneses/PAGINA_INCIAL/Pagina_inicial.dart';
import 'dart:convert';

import 'package:progress_indicator_button/progress_button.dart';
const api = 'http://bielapp.tecnologia.ws/json_retorno.php';


void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comprar Curso',
      theme: ThemeData(
        hintColor: Colors.white,
        textSelectionColor: Colors.purple,
        primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white)),
                focusedBorder:
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          )//TEMA DO INPUT TEXT

      ),
      home: MyHomePage(title: 'Inforgeneses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ======== CONTROLLER DOS TEXTFORM ===========
  final  controle_usuario  = new TextEditingController();
  final  controle_senha    = new TextEditingController();
  // ============================================



  @override
  Widget build(BuildContext context) {

//============== VARIAVEL GERAL ==================
    double altura = MediaQuery.of(context).size.width;
    double largura = MediaQuery.of(context).size.height;

    Color azul    = Colors.lightBlue;
    Color branco  = Colors.white;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    //=================================================


    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: azul, // PLANO DE FUNDO ROXO
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: largura,
                height: altura/1.5,
                decoration: BoxDecoration(
                    color: branco,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(0,100),
                        bottomRight: Radius.elliptical(70, 60))
                ),


              ),
              Container(
                padding: EdgeInsets.all(50),
                width: largura,
                height: altura/1.5,
                child:  Center(
                  child: Image.asset("assets/logo.png",
                    fit: BoxFit.contain,),
                )
              ),//IMAGEM LOGO,
            ],
          ),     //BANNER BRACO + LOGO
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
            width: largura/2,
            child:TextFormField(
              controller: controle_usuario,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.people_alt_rounded,
                    color: branco),
                prefixText: "  ",
                labelText: "Usuario",
                labelStyle: TextStyle(color: branco),
                border: OutlineInputBorder(),


              ),
              style: TextStyle(
                color: Colors.white,
              )

            ),
          ), // INPUT USUARIO
          Container(
            width: largura/2,
            child:TextField(
              obscureText: true,
                controller: controle_senha,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key,
                      color: branco),
                  prefixText: "  ",
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),


                ),
                style: TextStyle(
                  color: Colors.white,
                )

            ),
          ), // INPUT SENHA
          Container(
            margin: EdgeInsets.only(top: 40),
            width: largura/3,
            height: altura/7,
            child: ProgressButton(
              color: Colors.white,
              progressIndicatorColor: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              strokeWidth: 1,
              child: Text(
                "Entrar",
                style: TextStyle(
                  color: azul,
                  fontSize: 18,
                ),
              ),


              onPressed: (AnimationController controller) async {
                if (controller.isCompleted) {
                  controller.reverse();
                }
                else {
                  controller.forward(); //CONTROLE DE ANIMAÇÃO DO BOTÃO DE ENTRAR

                  String user = controle_usuario.text;
                  String pass = controle_senha.text;
                  int i = 0; // Variavel que percorre json
                  http.Response response = await http.get(api); //conecta com a API

                  var login_input,senha_input; // VARIAVEIS QUE REPRESENTAM OS DADOS INSERIDOS NO INPUT

                  //================ DO WHILE QUE PERCORRE E VALIDA USUARIO E SENNHA =========
                  do {
                    login_input = json.decode(response.body)[i]['login'];
                    senha_input = json.decode(response.body)[i]['senha'];

                    if(login_input == user && senha_input == pass){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Pagina_inicial())
                      );
                      break;

                    }
                    if(login_input != user || senha_input != pass ){
                      _scaffoldKey.currentState.showSnackBar(
                          new SnackBar(
                            backgroundColor: branco,
                              content: Row(
                                children: [
                                  Icon(Icons.thumb_down,color: azul,),
                                  SizedBox(width: 20),
                                  Expanded(child:
                                  Text('Usuario ou senha incorreto',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: azul,
                                        ),),)
                                ],
                              )));
                      controller.reverse();
                    }
                    i++;
                  }while( login_input != user);
                  //==========================================================================

                }
                },
            ),
          ), // BOTÃO ENTRAR

        ],
      ),

      )
    );
  }


}
