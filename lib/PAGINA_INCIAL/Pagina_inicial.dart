import 'package:flutter/material.dart';
import 'package:inforgeneses/BACK-ANd/Card_JSON.dart';
import 'package:inforgeneses/BACK-ANd/CARD_API.dart';
import 'package:inforgeneses/Drawer/Drawer_person.dart';
import 'package:inforgeneses/PAGINA_INCIAL/Card_Cursos.dart';
const api_cursos = 'http://bielapp.tecnologia.ws/json_retorno_Cursos.php';

enum OrdemLista{Add_primeiro,Add_ultimo}


class Pagina_inicial extends StatefulWidget {
  String nome,usuario,email;

  Pagina_inicial({
    this.nome,
    this.usuario,
    this.email,
  }
);

  @override
  _Pagina_inicialState createState() => _Pagina_inicialState();
}


class _Pagina_inicialState extends State<Pagina_inicial> {

  @override
  Widget build(BuildContext context) {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//=================== VARIAVEIS LOBAIS =============
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    Color azul = Colors.lightBlue; //COR AZUL DO TEMA
    Color branco = Colors.white; //COR BRANCA DO TEMA

    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            icon: Icon(Icons.menu,color: branco),
          ),
          centerTitle: true,
          title: Text('Cursos', style: TextStyle(color: branco)),
          shadowColor: Colors.black54,
          backgroundColor: Colors.lightBlue,
          actions: [
            PopupMenuButton<OrdemLista>(
              icon: (Icon(Icons.filter_alt_outlined,color: branco,)),
              itemBuilder: (context) =>
              <PopupMenuEntry<OrdemLista>>[
                const PopupMenuItem<OrdemLista>(
                  child: Text("Mais recentes"),
                  value: OrdemLista.Add_ultimo,),
                const PopupMenuItem<OrdemLista>(
                  child: Text("Mais antigo"),
                  value: OrdemLista.Add_primeiro,),
              ],
            )
          ],
        ),
        drawer: Drawer_personalizado(usuario: widget.usuario,email: widget.email,nome: widget.nome,),
        body: FutureBuilder<List<Cards>>(
          future: cursos_lista().decode(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ); //widget para quando tiver carreando
              case ConnectionState.none:
                return Center(
                  child: Text(
                    'Sem Conexão', style: TextStyle(color: Colors.white),),
                ); //Widget para quando não tiver dados
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, ID) {

                      return cards(
                        curso: "${snapshot.data[ID].curso}",
                        categoria: "${snapshot.data[ID].categoria}",
                        imagem: "${snapshot.data[ID].imagem}",
                        preco: "${snapshot.data[ID].preco}",
                        descricao: "${snapshot.data[ID].descricao}",
                        id: "${snapshot.data[ID].id}",
                      );
                    }
                ); // Widget que mostra os cards dos cursos
              default:
                return Center(
                  child: Text(
                    'Sem Conexão', style: TextStyle(color: branco),),
                );
            }
          },
        )

    );

  }


}

