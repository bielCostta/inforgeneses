
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                focusedBorder: OutlineInputBorder(
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {

//============== VARIAVEL GERAL ==================
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    Color azul    = Colors.lightBlue;
    Color branco  = Colors.white;

    //=================================================


    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: azul, // PLANO DE FUNDO ROXO
      body: SingleChildScrollView(
        child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: largura,
                height: altura/2.5,
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
                height: altura/2.5,
                child:  Center(
                  child: Image.asset("assets/logo.png",
                    fit: BoxFit.contain,),
                )
              ),//IMAGEM LOGO,
            ],
          ),     //BANNER BRACO + LOGO
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
            width: largura/1.2,
            child:TextFormField(
              controller: controle_usuario,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.people_alt_rounded,
                    color: branco),
                prefixText: "  ",
                labelText: "E-mail",
                labelStyle: TextStyle(color: branco),


              ),
              style: TextStyle(
                color: Colors.white,
              )

            ),
          ), // INPUT USUARIO
          Container(
            width: largura/1.2,
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
            width: largura/1.5,
            height: altura/13,
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

                  String email = controle_usuario.text;
                  String pass = controle_senha.text;
                  int i = 0; // Variavel que percorre json
                  http.Response response = await http.get(api); //conecta com a API
                    if(response.statusCode == 200){
                      var login_API,senha_API,nome_API,email_API; // VARIAVEIS QUE REPRESENTAM OS DADOS INSERIDOS NO INPUT

                      //================ DO WHILE QUE PERCORRE E VALIDA USUARIO E SENNHA =========
                      do {
                        login_API = json.decode(response.body)[i]['login'];
                        senha_API = json.decode(response.body)[i]['senha'];
                        nome_API  = json.decode(response.body)[i]['nome'];
                        email_API = json.decode(response.body)[i]['email'];

                        if(email_API == email && senha_API == pass){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Pagina_inicial(
                                nome: nome_API,
                                usuario: login_API,
                                email: email_API,
                              ))
                          );
                          break;

                        }
                        if(email_API != email || senha_API != pass ){
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
                      }while( login_API != email);
                      //==========================================================================


                    }else{
                      _scaffoldKey.currentState.showSnackBar(
                          new SnackBar(
                              backgroundColor: branco,
                              content: Row(
                                children: [
                                  Icon(Icons.cancel,color: azul,),
                                  SizedBox(width: 20),
                                  Expanded(child:
                                  Text('Erro de conexão com API',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: azul,
                                    ),),)
                                ],
                              )));;
                              controller.reverse();
                    } //CONDIÇÃO PARA QUANDO NÃO CONECTAR COM API

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
