class Profile {
  late String uid;
  late String name;
  late String location;
  int token = 1;
  int booksdonated = 0;
  int booksshared = 0;
  int bookstaken = 0;
  //constructor
  Profile(this.name, this.uid,  this.location){
    //to be written
  }
  Profile.fromweb(Map user){
    uid=user["uid"];
    name = user["name"];
    location=user["location"];
    token = user["token"] ?? 1;
    booksdonated = user["booksdonated"]??0;
    booksshared = user["booksshared"]??0;
    bookstaken = user["bookstaken"]??0;

  }
  Map upload(){
    Map map ={};
    map["uid"]=uid;
    map["name"]=name;
    map["location"]=location;
    map["booksdonated"]=booksdonated;
    map["booksshared"]= booksshared;
    map["bookstaken"]=bookstaken;

    return map;
  }
  String adress(){
    return "profiles/$uid";
  }
}