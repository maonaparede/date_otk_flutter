

import 'package:date_otk_flutter/main.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/standart_chat/chat_modelview.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:date_otk_flutter/service/id_file_handler_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GeneralModelView{



  nextAction(IdFile idFile , BuildContext context, dynamic modelView) async {
    dynamic scene = await GetScene().getSceneById(idFile);

    if (scene != null){
      //Se precisar add outra coisa "multi-cena" é só colocar aqui embaixo
      if (scene.runtimeType != ListButtonOptions) {
          await newScene(scene, context ,modelView);
          await saveProgress(idFile);
          return;
      }else{
        await updateScene(scene, modelView);
        return;
      }
    }

    return;
  }

  saveProgress(IdFile scene) async{
    await IdFileSharedPreferencesHandler().setIdFile(scene.id, scene.file);
    return;
  }

  newScene(dynamic scene, BuildContext context, dynamic modelView) async{
    String idScene = scene.idFile.id.substring(0,2);

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
    }

    return;
  }

  updateScene(Object scene, dynamic modelView) async{
          switch(modelView){
            case ChatModelView:
              await ChatModelView().updateModel(scene);
              break;

          }

          return;
  }




}