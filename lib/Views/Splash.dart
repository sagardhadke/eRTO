import 'package:flutter/material.dart';
import 'package:rto/Exports/myExports.dart';
import 'package:rto/Views/Category.dart';
import 'package:rto/Views/onBoard/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  void checkUseronBoard() async {
    try {
      final SharedPreferences myprefs = await SharedPreferences.getInstance();
      bool? onBoard = myprefs.getBool("onBoard");

      if (onBoard == null || !onBoard) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyOnBoarding()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyDashboard()));
      }
    } catch (e) {
      Uihelper.logger.e("${e.toString()}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyOnBoarding()));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyDashboard()));
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
