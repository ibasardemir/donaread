import 'package:sampleproject/auth.dart';
import "package:sampleproject/services/connector.dart";
import "package:sampleproject/datas/profile.dart";
// manages user profile
class Profilemanager{
  final String uid = Auth().currentUser?.uid ?? "";
  final Connector connector = Connector();
  static late Profile profile;
  late Map info;
  Profilemanager.load (){

    info= connector.rs("profiles/$uid") as Map;
    profile = Profile(info["name"],info["uid"],info["location"]);  }
  
  Profilemanager.register(Profile newbie){
    profile = newbie;

    connector.ws("profiles/$newbie.uid", newbie as Map);
  }
  Profilemanager();
}