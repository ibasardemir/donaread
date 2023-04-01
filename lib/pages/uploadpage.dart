import 'package:flutter/material.dart';
import '../datas/kitap.dart';

class UploadPage extends StatefulWidget {
  final List<Kitap> books;
  final void Function(String name, String isbn, String condition) onSubmit;

  const UploadPage({required this.books, required this.onSubmit, Key? key})
      : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final _formKey =
      GlobalKey<FormState>(); // GlobalKey to uniquely identify the form
  final _nameController =
      TextEditingController(); // TextEditingController for the book name
  final _isbnController =
      TextEditingController(); // TextEditingController for the book ISBN
  String _condition = 'Excellent'; // Default book condition is set to Excellent

  @override
  void dispose() {
    _nameController
        .dispose(); // Dispose the TextEditingController for book name when the widget is disposed
    _isbnController
        .dispose(); // Dispose the TextEditingController for book ISBN when the widget is disposed
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // If the form is valid, then perform the action
      // Here, you can perform some action with the book name, ISBN, and condition
      String name = _nameController
          .text; // Get the book name from the TextEditingController
      String isbn = _isbnController
          .text; // Get the book ISBN from the TextEditingController
      String condition = _condition; // Get the selected book condition
      // Add the uploaded book to the list
      widget.onSubmit(name, isbn,
          condition); // add the book to the books list by calling the onSubmit function
      // pop the current screen and return to the first page
      Navigator.of(context).pop(); // Return to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(child: Image.asset("assets/image.png")),
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        title: const Text('Upload Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller:
                    _nameController, // Set the TextEditingController to the text field for book name
                decoration: const InputDecoration(
                  hintText: 'Enter book name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a book name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller:
                    _isbnController, // Set the TextEditingController to the text field for book ISBN
                decoration: const InputDecoration(
                  hintText: 'Enter ISBN',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ISBN';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Book condition:'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Excellent',
                    groupValue:
                        _condition, // Set the selected book condition to the _condition variable
                    onChanged: (value) {
                      setState(() {
                        _condition = value!;
                      });
                    },
                  ),
                  const Text('Excellent'),
                  Radio<String>(
                    value: 'Good',
                    groupValue: _condition,
                    onChanged: (value) {
                      setState(() {
                        _condition = value!;
                      });
                    },
                  ),
                  const Text('Good'),
                  Radio<String>(
                    value: 'Barely readable',
                    groupValue: _condition,
                    onChanged: (value) {
                      setState(() {
                        _condition = value!;
                      });
                    },
                  ),
                  const Text('Barely readable'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
