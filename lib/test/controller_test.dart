import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/dialog_name.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/standart_chat/game_controller.dart';



class ControllerGameTest {
  String text =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium " +
      "doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore "+
      "veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim "+
      "ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia"+
      " consequuntur magni dolores eos qui ratione" +
          "voluptatem sequi nesciunt. "+
      "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, "+
      "adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et"+
      " dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis "+
      "nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea "+
      "commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit"+
      " esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";

  List<ButtonOptions> options = [
    ButtonOptions(text: "salve", idResponse: "1"),
    ButtonOptions(text: "rapaziada", idResponse: "1"),
    ButtonOptions(text: "Braba", idResponse: "1")
  ];

  Future start() async {
   // await Future.delayed(Duration(seconds: 3));
   // await GameController.instance.setBackground("assets/images/pp-removebg-preview.png");
   // await Future.delayed(Duration(seconds: 2));
   // await GameController.instance.setCharacter("assets/images/wlop.jpg");
    //await Future.delayed(Duration(seconds: 1));
    await GameController.instance.setDialogName(DialogName("... rgrgrggr", text));
    //await Future.delayed(Duration(seconds: 1));
    await GameController.instance.setButtons(options);
    //await Future.delayed(Duration(seconds: 2));
    //await GameController.instance.setOptions(null);
  }

  ChatModel returnModel(){
    return ChatModel(DialogName("... rgrgrggr", text), "assets/images/pp-removebg-preview.png", "assets/images/wlop.jpg");
  }
  
  ListButtonOptions returnButton(){
    return ListButtonOptions(options);
  }
}
