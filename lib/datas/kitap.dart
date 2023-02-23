// variables: id name isbn user user_location condition
class Kitap {
  final int id;
  final String name;
  final int isbn; final String uid; 
  final String userLocation;
  final String condition;
  //constructors
  Kitap(this.id,this.name, this.isbn, this.uid,  this.userLocation,this.condition);
  Kitap.fromweb(Map data):
    id = data["id"],
    name = data["name"],
    isbn = data["isbn"],
    uid = data["uid"],
    userLocation = data["user_location"],
    condition = data["condition"];
}

