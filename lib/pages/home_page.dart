import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/auth.dart';
import 'package:sampleproject/managers/profilemanager.dart';
import '../datas/profile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final User? user = Auth().currentUser; // current user
  final Profilemanager pmanager = Profilemanager(); // profile manager instance
  Profile? profile = Profilemanager.profile; // profile instance

  Future<void> signOut() async {
    await Auth().signOut(); // sign out method
  }

  Widget _title() {
    return const Text("Firebase Auth"); // app bar title
    //!Başlık
  }

  Widget _userUid(String? text)  {
    //final Profile? pp = pmanager.getpro();
    return Text("Merhaba, $text");
    //!Email
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text("Sign Out"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   FutureBuilder(builder: (context, AsyncSnapshot<String> text) {
                    return _userUid(text.data);
                  },future: pmanager.getname(),
                  ),
                  _signOutButton(),
                ])));
  }
}
