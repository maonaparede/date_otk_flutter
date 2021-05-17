

import 'package:date_otk_flutter/general_model_view.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';

abstract class PagesInterface{

  dynamic controller;
  dynamic modelView;
  dynamic model;
  dynamic context;

  updateModel(dynamic model);

  buttonPress(String id) async{
    await GeneralModelView().nextAction(id , modelView, model);
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