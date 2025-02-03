import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_fusion/SingInPage.dart';
import 'package:football_fusion/introPage.dart';
import 'package:football_fusion/main.dart';
import 'package:football_fusion/playerProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState(){
    return SplashscreenState();
  }
  
}
class SplashscreenState extends State<splashscreen>{
  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    wheretogo();
    
  }

  void wheretogo() async{
    var  sharedPref = await SharedPreferences.getInstance();
    var isloggedin = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2),(){

      if(isloggedin != null){
        if(isloggedin){
          Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => PlayerProfile())
      );
        }
        else{
          Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => PlayerSign())
      );
        }
      }else{
        Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => PlayerSign())
      );
      }
      
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