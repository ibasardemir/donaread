import 'package:flutter/material.dart';

class AdditionalUserInfoPage extends StatefulWidget {
  const AdditionalUserInfoPage({Key? key}) : super(key: key);

  @override
  _AdditionalUserInfoPageState createState() => _AdditionalUserInfoPageState();
}

class _AdditionalUserInfoPageState extends State<AdditionalUserInfoPage> {
  // Text editing controllers for the three input fields
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        title: const Text("Register"),
      ),
      body: Container(
        // Fill the entire height and width of the screen
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          // Center the contents horizontally and vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Create a text input field for the user's name
            _entryField("Name", _controllerName),
            // Create a text input field for the user's surname
            _entryField("Surname", _controllerSurname),
            // Create a text input field for the user's phone number
            _entryField("Phone Number", _controllerPhoneNumber),
            // Create a button to save the user's information (not yet implemented)
            ElevatedButton(
              onPressed: () {},
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create a text input field with a label
  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}

