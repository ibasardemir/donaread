import 'dart:ffi';

import 'package:flutter/material.dart';
import '../datas/kitap.dart';
import 'package:url_launcher/url_launcher.dart';
import "../services/connector.dart";


class BookDetailsPage extends StatefulWidget {
  final Kitap book;

  const BookDetailsPage({super.key, required this.book});

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState( book:book);
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final Kitap book;

   _BookDetailsPageState({ required this.book});
  @override
  Void? call() {
    Uri phoneno = Uri.parse('tel:${Connector().rs("profile/${book.uid}/phoneNumber")}');
    return null;
  }
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [Text("isim:${book.name}"),Text('Condition:${book.condition}'),IconButton(onPressed: call, icon: const Icon(Icons.phone))]),
      ),
    );
  }
}
