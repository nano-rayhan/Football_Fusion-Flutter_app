import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_fusion/introPage.dart';
import 'package:football_fusion/registration.dart';
import 'package:marquee/marquee.dart';

class Dialogbox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _dialogBox();
  }
}

class _dialogBox extends State<Dialogbox> {
  TextEditingController pNumber = TextEditingController();
  TextEditingController pPassword = TextEditingController(); 

  bool isButtonEnabled = false;

  void checkForm() {
    setState(() {
      isButtonEnabled =
          pNumber.text.isNotEmpty && pPassword.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    pNumber.addListener(checkForm);
    pPassword.addListener(checkForm);
  }

  @override
  void dispose() {
    pNumber.dispose();
    pPassword.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: () {
        FocusScope.of(context).unfocus(); 
      },
       child: Scaffold(
        appBar: AppBar(
            title: Text("Become a Player!"),
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
                  Text('Sign In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('Welcome to app ')
                ],               
              ),
            ),
 
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
          child: Text('Login',style: TextStyle(fontSize: 20),),)),
          SizedBox(height: 10,),
          TextButton(onPressed: (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Registration())
            );
          },
          child: Text('Create a new account', style: TextStyle(decoration: TextDecoration.underline, fontSize: 15),))
  
          ]         
        
         
      ),
    ),
  ) 
      
        
      
      
    )
    );
  }
  
}