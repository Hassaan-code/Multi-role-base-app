import 'package:flutter/material.dart';
import 'package:multi_role_based_app/splash_screen.dart';
import 'package:multi_role_based_app/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  final formData =  GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 30,
            ),

            TextFormField(
              controller: ageController ,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(height: 20,),
            InkWell
              (onTap: ()
            async
            {
              SharedPreferences sp =  await SharedPreferences.getInstance();
                sp.setString('Email',emailController.text.toString());
              sp.setString('Age',ageController.text.toString());
              sp.setBool('isLogin',true);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
            },
              child: Container(
                height: 50,
                color: Colors.red,
                child:Center(
                  child: Text('Login'
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
