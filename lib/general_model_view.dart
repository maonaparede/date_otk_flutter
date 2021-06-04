

import 'package:date_otk_flutter/main.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GeneralModelView{



  nextAction(IdFile idFile , BuildContext context, dynamic modelView, dynamic model) async {
    dynamic scene = await GetScene().getSceneById(idFile);

    if (scene != null){
      //Se precisar add outra coisa "multi-cena" é só colocar aqui embaixo
      if (scene.runtimeType != ListButtonOptions) {
        if (model.runtimeType == scene.runtimeType) {
          await updateScene(scene, modelView);
          return;
        }else{
          await newScene(scene, context ,modelView, idFile);
          return;
        }
      }else{
        await updateScene(scene, modelView);
        return;
      }
    }

    return;
  }


  newScene(dynamic scene, BuildContext context, dynamic modelView, IdFile idFile) async{
    String idScene = idFile.id.substring(0,2);

    //o id leva a outra tela
    if(idScene != null) {
      switch (idScene) {
        case "ch":
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
          break;
        default:
          return;
          break;
      }
      await updateScene(scene, modelView);
    }

    return;
  }

  updateScene(Object scene, dynamic modelView) async{
          await modelView.updateModel(scene);
          return;
  }


}