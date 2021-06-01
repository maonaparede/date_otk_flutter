
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/database/db_internal_interface.dart';
import 'package:date_otk_flutter/service/database/sql_lite.dart';
import 'package:date_otk_flutter/service/json_handler/json_reader.dart';

class GetScene{

  //retorna um model
  getSceneById(IdFile idFile) async{
    MapEntry<String, dynamic> response = await JsonReader().getModelById(idFile);
    dynamic scene = await returnModel(response);

    return scene;
  }

  returnModel(MapEntry<String, dynamic> response) {
    //todo vai ter q retornar o model que repreenta a cena

    //pega nome do elemento especifico, chat, buttons
    //print(response.entries.elementAt(1).key);

    //pega valor do elemento especifico, chat, buttons
    //print(response.entries.elementAt(1).value);
  }

}