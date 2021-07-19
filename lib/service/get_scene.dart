
import 'package:date_otk_flutter/service/create_models.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/json_handler/json_reader.dart';

class GetScene{

  getSceneById(IdFile idFile) async{
    MapEntry<String, dynamic> response = await JsonReader().getModelById(idFile);
    dynamic scene = await CreateModels().returnModel(response);

    return scene;
  }

}