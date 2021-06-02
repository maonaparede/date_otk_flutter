
import 'package:date_otk_flutter/create_models.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/json_handler/json_reader.dart';

class GetScene{

  //retorna um model
  getSceneById(IdFile idFile) async{
    MapEntry<String, dynamic> response = await JsonReader().getModelById(idFile);
    dynamic scene = await returnModel(response);

    return scene;
  }

  returnModel(MapEntry<String, dynamic> response) async{
    //todo vai ter q retornar o model que representa a cena
    CreateModels createModels = CreateModels();

    dynamic model = null;

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