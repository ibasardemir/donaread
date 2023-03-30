import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import "../managers/profilemanager.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      //Profilemanager.load();
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdditionalUserInfoPage()),
      );
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text("DonaRead");
  }

  Widget _entryField(
      String title, TextEditingController controller, bool paso) {
    return TextField(
        controller: controller,
        obscureText: paso,
        enableSuggestions: !paso,
        autocorrect: !paso,
        decoration: InputDecoration(
          labelText: title,
        ));
  }

  Widget _errorMessage() {
    return Text(errorMessage == "" ? "" : "Humm ? $errorMessage");
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  Widget _loginOrRegistrationButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          Profilemanager();
          isLogin = !isLogin;
          errorMessage = "";
        });
      },
      child: Text(isLogin ? "Register instead" : "Login instead"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(child: Image.asset("assets/image.png")),
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
              _entryField("email", _controllerEmail, false),
              _entryField("password", _controllerPassword, true),
              _errorMessage(),
              _submitButton(),
              _loginOrRegistrationButton(),
            ]),
      ),
    );
  }
}

class AdditionalUserInfoPage extends StatefulWidget {
  const AdditionalUserInfoPage({Key? key}) : super(key: key);

  @override
  _AdditionalUserInfoPageState createState() => _AdditionalUserInfoPageState();
}

class _AdditionalUserInfoPageState extends State<AdditionalUserInfoPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        title: Text("Register"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField("Name", _controllerName),
            _entryField("Surname", _controllerSurname),
            _entryField("Phone Number", _controllerPhoneNumber),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
