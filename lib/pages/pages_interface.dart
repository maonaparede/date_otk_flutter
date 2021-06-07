

import 'package:date_otk_flutter/general_model_view.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:date_otk_flutter/service/id_file_handler_shared_preferences.dart';
import 'package:date_otk_flutter/service/shared_preferences/shared_preferences_values.dart';
import 'package:flutter/widgets.dart';

abstract class PagesInterface{

  dynamic controller;
  dynamic modelView;

  updateModel(dynamic model);

  initScene() async{
    IdFile idFile = await IdFileSharedPreferencesHandler().getIdFile();
    dynamic scene = await GetScene().getSceneById(idFile);
    await GeneralModelView().updateScene(scene, modelView);
    return;
  }

  buttonPress(IdFile idFile , BuildContext context) async{
    await GeneralModelView().nextAction(idFile, context, modelView);
    await removeButtons();
    return;
  }

  showButtons(ListButtonOptions buttons){
    controller.setButtons(buttons);
  }

  removeButtons(){
    controller.setButtons(null);
  }

}