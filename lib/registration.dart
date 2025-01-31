import 'package:flutter/material.dart';
import 'package:football_fusion/playerProfile.dart';

class Registration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _registration();
  }
}

class _registration extends State<Registration> {
  TextEditingController pName = TextEditingController();
  TextEditingController pNumber = TextEditingController();
  TextEditingController pEmail = TextEditingController();
  TextEditingController pPassword = TextEditingController();

  bool isButtonEnabled = false;

  void checkForm() {
    setState(() {
      isButtonEnabled =
          pNumber.text.isNotEmpty && pPassword.text.isNotEmpty && pName.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    pNumber.addListener(checkForm);
    pPassword.addListener(checkForm);
    pName.addListener(checkForm);
  }

  @override
  void dispose() {
    pNumber.dispose();
    pPassword.dispose();
    pName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: (){
      FocusScope.of(context).unfocus();
    },
    

    
    
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Player registration'),
      ),
      body:  SingleChildScrollView(
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
            child:  FloatingActionButton(onPressed: isButtonEnabled?(){
             Navigator.push(context, 
             MaterialPageRoute(builder: (context) => Playerprofile()));
  }:null,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text('SignUp',style: TextStyle(fontSize: 20),),))
            
            
          ]         
        
         
      ),
    ),
  ),

    ));
  }
}