import 'package:flutter/material.dart';
import 'package:football_fusion/playerProfile.dart';
import 'package:football_fusion/registration.dart';

class Hostsignin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _hostsignin();
  }
}

class _hostsignin extends State<Hostsignin> {
  TextEditingController pNumber = TextEditingController();
  TextEditingController pPassword = TextEditingController();
  String? phoneeror;
  String? passwordError;
  
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

  void validateForm() {
    setState(() {
      phoneeror = pNumber.text.isEmpty ? "Email is required" : null;
      passwordError = pPassword.text.isEmpty ? "Password is required" : null;
    });

    if (phoneeror == null && passwordError == null) {
      print("Login Successful!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      }, 
    child: Scaffold(
      appBar: AppBar(
        title: Text('Become a Host!'),
        backgroundColor: Colors.blue,
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Column(
                children: [
                  Text('Sign In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('as a Host'),
                  
                ],               
              ),
            ),
 
              TextField( 
                controller: pNumber,
                keyboardType: TextInputType.number,
                
              decoration: InputDecoration(
                errorText: phoneeror,
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
                    errorText: passwordError,
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
            child:  FloatingActionButton(onPressed: 
            isButtonEnabled ?(){
             Navigator.push(context, 
             MaterialPageRoute(builder: (context) => PlayerProfile() ));
            }:null,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text('Login',style: TextStyle(fontSize: 20),),)),
          SizedBox(height: 10,),
          
          
          
          TextButton(onPressed:  (){
            
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Registration())
            );
         },
          child: Text('Create a new account', style: TextStyle(decoration: TextDecoration.underline, fontSize: 15),))
  
          ]         
        
         
      ),
    ),
  ),
    ));
  }
  
}