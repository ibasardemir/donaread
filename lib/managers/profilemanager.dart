import 'dart:async';
import 'dart:developer';
import 'package:sampleproject/auth.dart';
import "package:sampleproject/services/connector.dart";
import "package:sampleproject/datas/profile.dart";
// manages user profile
class Profilemanager{
  final String uid = Auth().currentUser?.uid ?? "";
  final Connector connector = Connector();
  static Profile? profile;
  late Map info;
  
  
  Profilemanager.register(Profile newbie){
    profile = newbie;

    connector.ws("profiles/$newbie.uid", newbie as dynamic);
  }
  Profilemanager(){
     if (profile==null){
    try {
      //final dynamic n = connector.rs("profile/$uid");
      connector.rs("profile/$uid").then((Map n) {
        log("${n} budur");
      profile= Profile.fromweb(n);
      } as FutureOr Function(dynamic value));
      
    //profile= Profile.fromweb(n);
  
} catch (e) {
 log("$e");
}
      
    }

  }
  
  Future<Profile?> getpro() async{
    if (profile==null){
    try {
      final dynamic n = connector.rs("profile/$uid");
      
    
    profile= Profile.fromweb(n);
  
} catch (e) {
 //profile = Profile("basar", "uid", "istanbul");
}
      
    }
    return profile;
  }
  Future<String> getname() async{
    if (profile==null){
    try {
      final dynamic n = connector.rs("profile/$uid");
      
    
    profile= Profile.fromweb(n);
    log("${profile?.name} budurr");
  
} catch (e) {
 //profile = Profile("basar", "uid", "istanbul");
}
      
    }
    return profile?.name ?? profile.toString();
  }
}