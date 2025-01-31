import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_fusion/introPage.dart';
import 'package:marquee/marquee.dart';

class Dialogbox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _dialogBox();
  }
}

class _dialogBox extends State<Dialogbox> {
  TextEditingController pName = TextEditingController();
  TextEditingController pNumber = TextEditingController();
  TextEditingController pEmail = TextEditingController();
  TextEditingController pPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: () {
        FocusScope.of(context).unfocus(); 
      },
       child: Scaffold(
      
      appBar: AppBar(
        title: SizedBox(
          height: 30, 
          child: Marquee(
            text: "Welcome to the Football Tournament Management App!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            scrollAxis: Axis.horizontal, 
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 50.0, 
            velocity: 50.0, 
            pauseAfterRound: Duration(seconds: 1), 
            startPadding: 10.0, 
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      
      
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Column(
                children: [
                  Text('SignUp', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('Welcome to app ')
                ],               
              ),
            ),
              
              TextField(
                controller: pName,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11)
                )
              ),
            ),
  
              SizedBox(height: 20,),
              
              TextField( 
                controller: pNumber,
                keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your Phone number',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11)
                )
              ),
            ),
            SizedBox(height: 20,),
              
              TextField(
                controller: pEmail, 
                keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11)
                )
              ),
            ),
            SizedBox(height: 20,),
              
              TextField( 
                    controller: pPassword,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11)
                )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 50,
            child:  FloatingActionButton(onPressed: (){
             
  },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text('SignUp',style: TextStyle(fontSize: 20),),))
            
            
          ]         
        
         
      ),
    ),
  ) 
      
        
      
      
    )
    );
  }
  
}