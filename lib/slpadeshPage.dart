import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_fusion/SingInPage.dart';
import 'package:football_fusion/introPage.dart';
import 'package:football_fusion/main.dart';

class splashscreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState(){
    return _SplashscreenState();
  }
  
}
class _SplashscreenState extends State<splashscreen>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => PlayerSign()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
        height: double.infinity,
        width: double.infinity,
        child:  Image.asset('assets/images/font1.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,),
      ),
      ],
      ),
    );
  }
}