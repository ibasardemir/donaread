// variables: id name isbn user user_location 
class Kitap {
  late int id;
  late String name;
  late int isbn; late String uid; late String user_Location;
  Map data={};
  //constructor
  Kitap(this.id,this.name, this.isbn, this.uid,  this.user_Location){
    //to be written
  }
  Kitap.fromweb(Map data){
    id = data["id"];
    name = data["name"];
    isbn = data["isbn"];
    uid = data["uid"];
    user_Location = data["user_location"];

  }
}

