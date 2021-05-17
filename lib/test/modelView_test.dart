import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/dialog_name.dart';
import 'package:date_otk_flutter/pages/standart_chat/game_modelview.dart';

class ModelViewTest{

  var context;


  ModelViewTest(this.context);



  List<ButtonOptions> options = [
    ButtonOptions(text: "salve", idResponse: "1"),
    ButtonOptions(text: "rapaziada", idResponse: "1"),
    ButtonOptions(text: "Braba", idResponse: "1")
  ];

  ChatModel chatModel = new ChatModel(DialogName("name", "dialog"),
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