import 'package:flutter/material.dart';
import 'package:rto/Views/Category.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 1500), () {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyCategory()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2751A2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
                  height: 180, fit: BoxFit.contain, "Assets/eRTO.png"))
        ],
      ),
    );
  }
}
