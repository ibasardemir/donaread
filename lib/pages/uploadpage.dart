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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _isbnController = TextEditingController();
  String _condition = 'Excellent';

  @override
  void dispose() {
    _nameController.dispose();
    _isbnController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Here, you can perform some action with the book name, ISBN, and condition
      String name = _nameController.text;
      String isbn = _isbnController.text;
      String condition = _condition;
      print('Uploading book: $name, ISBN: $isbn, Condition: $condition');
      // Add the uploaded book to the list
      widget.onSubmit(name, isbn, condition); // add the book to the books list
      // pop the current screen and return to the first page
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                controller: _nameController,
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
                controller: _isbnController,
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
                    groupValue: _condition,
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

