

import 'package:inforgeneses/PAGINA_INCIAL/Card_Cursos.dart';

class Cards{

  final String id,curso,categoria,imagem,preco,descricao;

  Cards({this.id, this.curso, this.categoria, this.imagem, this.preco, this.descricao});

  factory Cards.fromJson(Map<String, dynamic> json){
    return Cards(
      id:         json["id"],
      curso:      json["Nome_curso"],
      categoria:  json["Categoria"],
      imagem:     json["Imagem"],
      preco:      json["Preco"],
      descricao:  json["Descricao"],
    );
  }

}
