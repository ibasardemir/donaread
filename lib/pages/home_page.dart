import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/auth.dart';
import 'package:sampleproject/managers/profilemanager.dart';
import '../datas/profile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final Profilemanager pmanager = Profilemanager();
  final User? user = Auth().currentUser;
  Profile profile = Profilemanager.profile ?? Profile().upload() as Profile;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text("Firebase Auth");
    //!Başlık
  }

  Widget _userUid() {
    return Text("Merhaba, ${profile.name}");
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
                  _userUid(),
                  _signOutButton(),
                ])));
  }
}
