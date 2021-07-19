


import 'package:date_otk_flutter/general_model_view.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:date_otk_flutter/service/shared_preferences_handler.dart';
import 'package:flutter/widgets.dart';

abstract class PagesInterface{

  dynamic controller;
  dynamic modelView;

  updateModel(dynamic model);

  initScene() async{
    IdFile idFile = await SharedPreferencesHandler().getIdFile();
    dynamic scene = await GetScene().getSceneById(idFile);
    await GeneralModelView().initScene(scene, modelView);
    return;
  }

  buttonPress(IdFile idFile, BuildContext context) async{
    await GeneralModelView().nextAction(idFile, context, modelView);
    return;
  }

  showButtons(ListButtonOptions buttons) async{
    List<ButtonOptions> value = [];
    value = buttons.list;
    await controller.setButtons(value);
    return;
  }

  removeButtons(){
    controller.setButtons(null);
    return;
  }

}