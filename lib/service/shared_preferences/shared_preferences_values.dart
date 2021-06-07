
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesValues{

  Future<void> create(String key, dynamic value) async{
    var prefs = await SharedPreferences.getInstance();
    
    switch(value.runtimeType){
      case String:
        prefs.setString(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
        default:
          return Future.error("Value type: " + value.runtimeType.toString() +
              " is not suported by 'shared_preference_values.dart'");
          break;
    }
    return;
  }

  Future<dynamic> read(String key) async{
    var prefs = await SharedPreferences.getInstance();
    dynamic value = prefs.get(key);
    return value;
  }

  Future<bool> delete(String key) async{
    var prefs = await SharedPreferences.getInstance();
    
    return await prefs.remove(key);
  }

  _returnNull(String key){
    Future.error("The key: "+key+" has a null value");
    return null;
  }

}