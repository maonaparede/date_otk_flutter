
import 'dart:developer';

import 'package:date_otk_flutter/main.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/dialog_name.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/standart_chat/game.dart';
import 'package:date_otk_flutter/service/database/db_internal_interface.dart';
import 'package:date_otk_flutter/service/database/sql_lite.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:flutter/material.dart';


class GeneralModelView{

  DbInternal db = new SQLite();


  nextAction(String id , dynamic modelView, dynamic model) async {
    dynamic scene = await GetScene().getSceneById(id);

    if (scene != null) {
      //Se precisar add outra coisa "multi-cena" é só colocar aqui embaixo
      if (scene.runtimeType != ListButtonOptions) {
        if (model.runtimeType == scene.runtimeType) {
          await updateScene(scene, modelView);
          return;
        }else{
          await newScene(scene, modelView, id);
          return;
        }
      }else{
        await updateScene(scene, modelView);
        return;
      }
    }

  }


  newScene(dynamic scene, dynamic modelView, String id) async{
    String idScene = id.substring(0,2);

    //o id leva a outra tela
    if(idScene != null) {
      switch (idScene) {
        case "ch":
          //await Navigator.of(modelView.context).pushReplacementNamed("GamePage");
          break;
        default:
          return;
          break;
      }
      await updateScene(scene, modelView);
    }
  }

  updateScene(Object scene, dynamic modelView) async{
          await modelView.updateModel(scene);
  }

  dynamic getFromJson(String archive, String id) {
    return ChatModel(DialogName("dialogName" , "feefe"), "background", "character");
    //return null;
  }
}