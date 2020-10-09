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
    //=================================================


    return Scaffold(
      backgroundColor: Colors.purple, // PLANO DE FUNDO ROXO
      body: SingleChildScrollView(
        child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: largura,
                height: altura/1.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(70,60),
                        bottomRight: Radius.elliptical(70, 60))
                ),


              ),
              Positioned(
                bottom: 20,
                  right: 5,
                  child: Container(
                    width: largura/2,
                    child:  Image.asset("assets/LOGO.png",
                      fit: BoxFit.contain,),
                  ))


            ],
          ),     //BANNER BRACO + LOGO
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
            width: largura/2,
            child:TextField(
              cursorColor: Colors.white,
              controller: controle_usuario,
              decoration: InputDecoration(
                labelText: 'Usuario',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixText: "  ",
                suffixIcon: Icon(
                  Icons.people_alt_rounded,
                  color: Colors.white,
                ),

              ),

            ),


          ), // INPUT USUARIO
          Container(
            width: largura/2,
            child: TextFormField(
              controller: controle_senha,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,)

                ),
                suffixIcon: Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                ),
              ),
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
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),


              onPressed: (AnimationController controller) async {
                if (controller.isCompleted) {
                  controller.reverse();


                } else {
                  controller.forward();
                FutureBuilder(
                      future: getData(),
                      builder: (context, snap){
                        switch(snap.connectionState) {
                          case ConnectionState.none:
                            return (Center(
                                child: Text('sem conexão', style: TextStyle(
                                    fontSize: 20, color: Colors.red),)
                            ));
                          case ConnectionState.active:
                            return (Center(
                                child: Text('CONEXÃO ATIVA', style: TextStyle(
                                    fontSize: 20, color: Colors.red),)
                            ));
                          default:
                            return (Center(
                                child: usuario = snap.data[0]['login']
                            )
                            );
                        }
                      },
                    );



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
