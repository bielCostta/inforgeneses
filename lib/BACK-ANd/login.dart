
import 'package:http/http.dart' as http;
import 'package:inforgeneses/BACK-ANd/Card_JSON.dart';
import 'package:inforgeneses/PAGINA_INCIAL/Pagina_inicial.dart';
import 'dart:convert';
const api = 'http://bielapp.tecnologia.ws/json_retorno.php';


class cursos_lista{

    conectando_API() async {
      http.Response RESPOSTA = await http.get(api);
      decode(RESPOSTA);
    }

      decode(http.Response RESPOSTA){

      if(RESPOSTA.statusCode == 200){
        var decoded = json.decode(RESPOSTA.body);
        List<CardJSON> cardjson = decoded[0].map<CardJSON>(
            (map){
              return CardJSON.fromJson(map);
            }
        );

      }
      }


}







