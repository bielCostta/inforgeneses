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
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [

                TextFormField(
                  controller: controle_usuario,
                  decoration: InputDecoration(
                    icon: Icon(Icons.supervised_user_circle),
                    labelText: 'USUARIO',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                ),
                Container(
                  height: 10,
                  width: 10,
                  child: TextFormField(
                    controller: controle_senha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      errorText: 'Ensira a senha',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: largura/4,
                  height: altura/7,
                  child: ProgressButton(
                    color: Colors.white,
                    progressIndicatorColor: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    strokeWidth: 2,
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: (AnimationController controller) {
                      if (controller.isCompleted) {

                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}
