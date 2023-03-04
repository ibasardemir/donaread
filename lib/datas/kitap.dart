// variables: id name isbn user user_location condition
class Kitap {
  final int id;
  final String name;
  final int isbn; final String uid; 
  final String userLocation;
  final String condition;
  final String foto = "https://cdn.pixabay.com/photo/2023/01/31/05/59/zebra-7757193_960_720.jpg";
  //constructors
  Kitap({required this.id,required this.name, required this.isbn, required this.uid,  required this.userLocation,required this.condition});
  Kitap.fromweb(Map data):
    id = data["id"],
    name = data["name"],
    isbn = data["isbn"],
    uid = data["uid"],
    userLocation = data["user_location"],
    condition = data["condition"];
}

