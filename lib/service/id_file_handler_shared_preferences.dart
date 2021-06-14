


import 'package:date_otk_flutter/models/id_file.dart';
import 'shared_preferences/shared_preferences_values.dart';

class IdFileSharedPreferencesHandler{


  setIdFile(String id, String file) async {
    await SharedPreferencesValues().create("idScene", id);
    await SharedPreferencesValues().create("fileScene", file);
    return;
  }

   Future<IdFile> getIdFile() async {

    IdFile idFile = await _getIdFileFromSharedPreferences();

    if(idFile.id == null || idFile.file == null){
      print("class: IdFileSharedPreferencesHandler. The values from id and/or file are null.");
      print("Null values. Restoring values from id and file to default...");
      await _setDefaultIdFile();
      IdFile file = await _getIdFileFromSharedPreferences();
      return file;
    }else{
     print("class: IdFileSharedPreferencesHandler. Returning idFile from Shared Preferences");
     return idFile;
     }

  }

  _setDefaultIdFile() async {
    await SharedPreferencesValues().create("idScene", "ch1");
    await SharedPreferencesValues().create("fileScene", "rota1");
    return;
  }

   Future<IdFile> _getIdFileFromSharedPreferences() async{
    String id = await SharedPreferencesValues().read("idScene");
    String file = await SharedPreferencesValues().read("fileScene");
    return IdFile(id: id,file: file);
  }


}