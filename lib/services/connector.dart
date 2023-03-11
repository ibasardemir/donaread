import 'package:firebase_database/firebase_database.dart';

class Connector {

  final FirebaseDatabase database = FirebaseDatabase.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> ws(String path, var message) async{
   await ref.update({path:message});
  }
  Future<dynamic> rs(String path) async{
    //final snapshot = await ref.child(path).get();
    final event = await ref.child("profile/jDk3CgeBY5YufvCKHhKqSkYET6L2").once(DatabaseEventType.value);
    return event.snapshot.value;
  }
}