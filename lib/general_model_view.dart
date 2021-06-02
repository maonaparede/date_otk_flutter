
import 'dart:developer';

import 'package:date_otk_flutter/main.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/standart_chat/game.dart';
import 'package:date_otk_flutter/service/database/db_internal_interface.dart';
import 'package:date_otk_flutter/service/database/sql_lite.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:flutter/material.dart';


class GeneralModelView{

  DbInternal db = new SQLite();


  nextAction(IdFile idFile , dynamic modelView, dynamic model) async {
    dynamic scene;

    if (scene != null) {
      //Se precisar add outra coisa "multi-cena" é só colocar aqui embaixo
      if (scene.runtimeType != ListButtonOptions) {
        if (model.runtimeType == scene.runtimeType) {
          await updateScene(scene, modelView);
          return;
        }else{
          await newScene(scene, modelView, idFile);
          return;
        }
      }else{
        await updateScene(scene, modelView);
        return;
      }
    }

  }


  newScene(dynamic scene, dynamic modelView, IdFile idFile) async{
    String idScene = idFile.id.substring(0,2);

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


}