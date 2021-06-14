
import 'package:date_otk_flutter/service/create_models.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/json_handler/json_reader.dart';

class GetScene{

  //retorna um model
  getSceneById(IdFile idFile) async{
    MapEntry<String, dynamic> response = await JsonReader().getModelById(idFile);
    dynamic scene = await _returnModel(response);

    return scene;
  }

    _returnModel(MapEntry<String, dynamic> response) async{
    CreateModels createModels = CreateModels();

    dynamic model;

    switch(response.key){
      case "chat":
        model = await createModels.chatModel(response.value[0]);
        break;
      case "button":
        model = await createModels.buttonModel(response.value);
        break;

      default:
        break;
    }

    return model!=null? model :
    Future.error("getScene error, model: "+ model.toString());
  }

}