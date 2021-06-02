import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/pages/standart_chat/game_modelview.dart';

class ModelViewTest{

  var context;


  ModelViewTest(this.context);



  List<ButtonOptions> options = [
    ButtonOptions(idFile: IdFile(file: "rota1" , id:"ch1"), text: "salve"),
    ButtonOptions(idFile: IdFile(file: "rota1" , id:"ch1"),text: "rapaziada"),
    ButtonOptions(idFile: IdFile(file: "rota1" , id:"ch1"),text: "Braba")
  ];

  ChatModel chatModel = new ChatModel(IdFile(file: "rota1" , id:"ch1") ,NameDialog("name", "dialog"),
      "assets/images/pp-removebg-preview.png", "assets/images/wlop.jpg");

  Future start() async {

     // await Future.delayed(Duration(seconds: 3));
      GameModelView(context).updateModel(chatModel);
    //await Future.delayed(Duration(seconds: 2));
    //await GameController.instance.setOptions(null);
  }

  returnGameModelView(){
    return GameModelView(context);
  }

}