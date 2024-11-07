import 'package:flutter/material.dart';
import 'package:rto/Exports/myExports.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Uihelper.myDrawer(context),
      appBar: AppBar(
          title:
              Uihelper.myText('Home', TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white),
    );
  }
}
