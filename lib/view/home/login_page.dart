import 'dart:convert';
import 'package:comicreadingapp/component/rounded_button/rounded_button.dart';
import 'package:comicreadingapp/service/remote_service/auth_service.dart';
import 'package:comicreadingapp/service/remote_service/globals.dart';
import 'package:comicreadingapp/view/dashboard/dashboard_screen.dart';
import 'package:comicreadingapp/view/home/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = '';
  String password = '';

  logInPressed() async{
    if(email.isNotEmpty && password.isNotEmpty){
      http.Response response = await AuthServices.login(email, password);
      Map responseMap = jsonDecode(response.body);
      if(response.statusCode == 200)
        {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('email', emailController.text);

          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => const DashboardScreen()));
        }else{
        errorSnackBar(context, responseMap.values.first);
      }
    }else{
      errorSnackBar(context, 'Enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Log In',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email'
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: 30),
            TextField(
              obscureText: true,
              controller: passController,
              decoration: const InputDecoration(
                  hintText: 'Enter your password'
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: 50),
            RoundedButton(
                btnText: 'LOG IN',
                onBtnPressed: () => logInPressed()),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => const RegisterPage(),));
              },
              child: const Text(
                'I do not have an account',
                style: TextStyle(
                    decoration: TextDecoration.underline
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => const DashboardScreen(),));
              },
              child: const Text(
                'Remind me later',
                style: TextStyle(
                    decoration: TextDecoration.underline
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
