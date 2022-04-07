import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 7000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
