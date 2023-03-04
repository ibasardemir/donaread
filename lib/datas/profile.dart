class Profile {
  late String uid;
  late String name;
  late String location;
  int token = 1;
  //constructor
  Profile(this.name, this.uid,  this.location){
    //to be written
  }
  Profile.fromweb(Map user){
    uid=user["uid"];
    name = user["name"];
    location=user["location"];
    token = user["token"] ?? 1;
  }
  Map upload(){
    Map map ={};
    map["uid"]=uid;
    map["name"]=name;
    map["location"]=location;

    return map;
  }
  String adress(){
    return "profiles/$uid";
  }
}