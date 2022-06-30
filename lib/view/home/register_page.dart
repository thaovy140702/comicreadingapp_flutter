import 'dart:convert';
import 'package:comicreadingapp/component/rounded_button/rounded_button.dart';
import 'package:comicreadingapp/service/remote_service/auth_service.dart';
import 'package:comicreadingapp/view/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../service/remote_service/globals.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = '';
  String email = '';
  String password = '';

  createAccountPressed(BuildContext context, VoidCallback onSuccess) async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) {
      http.Response response = await AuthServices.register(
          name, email, password);
      Map responseMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        onSuccess.call();
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'Email not valid');
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
          'Registration',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 40
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Name'
              ),
              onChanged: (value){
                name = value;
              },
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Email'
              ),
              onChanged: (value){
                email = value;
              },
            ),
            const SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Password'
              ),
              onChanged: (value){
                password = value;
              },
            ),
            const SizedBox(height: 40),
            RoundedButton(
                btnText: 'Create Account',
                onBtnPressed: () => createAccountPressed(context,(){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => const DashboardScreen()));
                })),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),));
              },
              child: const Text(
                'Already have an account',
                style: TextStyle(
                  decoration: TextDecoration.underline
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

}
