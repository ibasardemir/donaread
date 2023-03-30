import 'package:sampleproject/auth.dart';
import 'package:sampleproject/services/connector.dart';
import "package:sampleproject/datas/kitap.dart";
import 'dart:developer';



class Bookmanager{
final Connector connector = Connector();
Future<List> viewBooks() async{
  List<Kitap> kitap = [];
connector.rs("book").then((dynamic n) {
  n.forEach((book){
    kitap.add(book as Kitap);
  });
      });
return kitap;
}
Future<void> publishBook(Kitap book) async{
connector.ws("book/${book.id}", book.toweb());
log("sas");


}
Future<List> myBooks() async{
  return[];
}
}