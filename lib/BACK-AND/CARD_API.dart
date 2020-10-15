
import 'package:http/http.dart' as http;
import 'package:inforgeneses/BACK-ANd/Card_JSON.dart';
import 'dart:convert';

final api = 'http://bielapp.tecnologia.ws/json_retorno_Cursos.php';

class cursos_lista {


  Future<List<Cards>> decode() async {
    http.Response RESPOSTA = await http.get(api);
    if (RESPOSTA.statusCode == 200) {

      var decoded = json.decode(RESPOSTA.body);

      List<Cards> cardjson = decoded.map<Cards>( (map) {
        return Cards.fromJson(map);   }).toList();

      return cardjson;

    } else{
      throw Exception("Erro na classe CARD_API");
    }


  }


}






