

import 'package:date_otk_flutter/general_model_view.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:flutter/widgets.dart';

abstract class PagesInterface{

  dynamic controller;
  dynamic modelView;
  dynamic model;

  updateModel(dynamic model);

  buttonPress(IdFile idFile , BuildContext context) async{
    await GeneralModelView().nextAction(idFile , context ,modelView, model);
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