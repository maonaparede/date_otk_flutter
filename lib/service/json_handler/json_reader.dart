import 'dart:convert';

import 'package:date_otk_flutter/models/id_file.dart';
import 'package:flutter/services.dart';

class JsonReader{


  Future<MapEntry<String, dynamic>> getModelById(IdFile idFile) async {

    Map<String, dynamic> model = await _readJsonFile(idFile.file);
    List<dynamic> data = await model['model'];

    MapEntry<String, dynamic> response = null;

    //search by id
    data.forEach((element) {
      Map<String, dynamic> q = element;

      if(idFile.id == q['id']){
        response = q.entries.elementAt(1);
      }
    });


    return response != null? response :
      Future.error("id: "+ idFile.id +"in file: " + idFile.file + " do not exist");
  }


  Future<Map<String, dynamic>> _readJsonFile(String file) async {
    return jsonDecode(await rootBundle.loadString("assets/json/" + file + ".json"));
  }


}