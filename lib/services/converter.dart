import 'dart:convert';
class Converter{

  static Map jmap(String json){
    json = json.replaceAll(RegExp(r':'), '":');
    json = json.replaceAll(RegExp(r','), ',"');
     json = json.replaceAll(RegExp(r'{'), '{"');
    return jsonDecode(json) as Map<String, dynamic>;
  }

}