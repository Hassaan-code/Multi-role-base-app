import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_role_based_app/home_screen.dart';
import 'package:multi_role_based_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? false;
    sp.get('isLogin');

    if (isLogin) {
      super.initState();
      Timer(Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Image(
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fitHeight,
        image:
        AssetImage('assets/splash.jpg'),),

    );
  }
}