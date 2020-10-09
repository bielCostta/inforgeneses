
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inforgeneses/login.dart';
import 'package:progress_indicator_button/button_stagger_animation.dart';
import 'package:progress_indicator_button/progress_button.dart';

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

      ),
      home: MyHomePage(title: 'Inforgeneses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    // ======== CONTROLLER DOS TEXTFORM ===========
   final TextEditingController controle_usuario  = new TextEditingController();
   final TextEditingController controle_senha    = new TextEditingController();
    String usuario;
    String senha;
    // ============================================


    //============== VARIAVEL GERAL ==================
    double altura = MediaQuery.of(context).size.width;
    double largura = MediaQuery.of(context).size.height;

    Color azul    = Colors.lightBlue;
    Color branco  = Colors.white;

    //=================================================


    return Scaffold(
      backgroundColor: azul, // PLANO DE FUNDO ROXO
      body: SingleChildScrollView(
        child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: largura,
                height: altura/1.3,
                decoration: BoxDecoration(
                    color: branco,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(0,100),
                        bottomRight: Radius.elliptical(70, 60))
                ),


              ),
              Center(
               heightFactor: 5,
               child: Container(
                    width: largura/2.5,
                    child:  Image.asset("assets/logo.png",
                      fit: BoxFit.contain,),
                  )) //IMAGEM LOGO


            ],
          ),     //BANNER BRACO + LOGO
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
            width: largura/2,
            child:TextField(

              controller: controle_usuario,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.people_alt_rounded,
                    color: branco),
                prefixText: "  ",
                labelText: 'Usuario',
                labelStyle: TextStyle(color: branco),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),


              ),
              style: TextStyle(
                color: Colors.white,
              )

            ),
          ), // INPUT USUARIO
          Container(
            width: largura/2,
            child:TextField(
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
            margin: EdgeInsets.only(top: 50),
            width: largura/3,
            height: altura/7,
            child: ProgressButton(
              color: Colors.white,
              progressIndicatorColor: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(8)),
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


                } else {
                  controller.forward();
                  String user = controle_usuario.text;

                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => Pagina_inicial()
                  // )
                  // );
                  Login(
                    usuario: "gabriel",
                    senha: "123"
                  ).buscar();

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
