import 'package:flutter/material.dart';
import '../datas/kitap.dart';

class BookDetailsPage extends StatefulWidget {
  final Kitap book;

  const BookDetailsPage({super.key, required this.book});

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('Book details here'),
      ),
    );
  }
}
