import 'dart:async';
import 'package:comicreadingapp/view/home/login_page.dart';
import 'package:comicreadingapp/view/home/register_page.dart';
import 'package:comicreadingapp/view/widgets/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/dashboard_screen.dart';
import '../widgets/app_text.dart';

String finalEmail = '';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _totalDots = 3;
  double _currentPosition = 0.0;

  @override
  void initState(){
    getValidationData().whenComplete(() async{
      Timer(const Duration(seconds: 2), () => Get.to(
          finalEmail.isEmpty ? () => const LoginPage() : () => const DashboardScreen()
      ));
    });
  }

  Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail!;
    });

  }
  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }



  _onPageChanged(int index){
    setState(() {
      _currentPosition = _currentPosition.ceilToDouble();
      // _updatePosition(max(--_currentPosition, 0));
      _updatePosition(index.toDouble());
      print(index);
      print(_currentPosition);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(

              height: MediaQuery.of(context).size.height/2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/welcome.png"),
                      fit:BoxFit.fill
                  )
              ),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Container(
                      height: 250,
                      padding: const EdgeInsets.only(top:50, left: 50, right: 50),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10),
                      child: AppLargeText(text: "Welcome!", size: 32
                      ),
                    ),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Container(
                height: 250,
                padding: const EdgeInsets.only(left: 50, right: 30),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 10),
                child: AppText(text: "Let's discover your favorite comics ...", size: 18
                ),
              ),
            ),

            Expanded(child:

            Stack(
              children: [
                Positioned(
                    height: 80,
                    bottom: 80,
                    left: (MediaQuery.of(context).size.width-200)/2,
                    right: (MediaQuery.of(context).size.width-200)/2,
                    child:
                    GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=> const RegisterPage()));
                        },

                        child:Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Get Started',
                                  style: TextStyle(color: Colors.white, fontSize: 24),
                                ),
                              ],
                            )
                        ))
                )
              ],
            )
            )
          ],
        )
    );
  }
}