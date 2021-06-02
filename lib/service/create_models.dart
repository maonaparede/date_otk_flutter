
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';

class CreateModels{


  Future<ChatModel> chatModel(Map<String, dynamic> data) async {
    return ChatModel(
        IdFile(id: data['id'],file: data['file']),
        NameDialog(data['name'], data['said']),
        data['background'],
        data['character']
    );
  }

  Future<ListButtonOptions> buttonModel( List<dynamic> data) async {
    List<ButtonOptions> list;

    data.forEach((element) {
      list.add(
          ButtonOptions(
              idFile: IdFile(id: element['id'], file: element['file']),
              text: element['text']));
    });

    return ListButtonOptions(list);
  }


}