

import 'package:inforgeneses/PAGINA_INCIAL/Card_Cursos.dart';

class CardJSON{

  final String id,curso,categoria,imagem,preco,descricao;

  CardJSON({this.id, this.curso, this.categoria, this.imagem, this.preco, this.descricao});

  factory CardJSON.fromJson(Map<String, dynamic> json){
    return CardJSON(
      id:         json[0]["id"],
      curso:      json[0]["Nome_curso"],
      categoria:  json[0]["Categoria"],
      imagem:     json[0]["Imagem"],
      preco:      json[0]["Preco"],
      descricao:  json[0]["Descricao"],
    );
  }

}
