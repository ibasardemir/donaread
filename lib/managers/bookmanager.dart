import 'package:sampleproject/auth.dart';
import 'package:sampleproject/services/connector.dart';
import "package:sampleproject/datas/kitap.dart";


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
Future<void> publishBook() async{


}
Future<List> myBooks() async{
  return[];
}
}