import 'package:sampleproject/auth.dart';

import "package:sampleproject/pages/searchpage.dart";

import "package:sampleproject/pages/firstpage.dart";
import 'package:sampleproject/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  const SearchPageTo();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
