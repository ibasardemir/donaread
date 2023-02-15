import 'package:firebase_database/firebase_database.dart';
class Connector {

  final FirebaseDatabase database = FirebaseDatabase.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> ws(String path, var message) async{
   await ref.update({path:message});
  }
  Future<Object?> rs(String path) async{
    final snapshot = await ref.child(path).get();
    return snapshot.value;
  }
}