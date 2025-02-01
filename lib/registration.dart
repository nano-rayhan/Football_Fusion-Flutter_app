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

  final _formkey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  void checkForm() {
    if (_formkey.currentState != null) { // ✅ Check if form is not null
      setState(() {
        isButtonEnabled = _formkey.currentState!.validate();
      });
    }
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
              
              TextFormField(
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
              validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
              
            ),
            
  
              SizedBox(height: 20,),
              
              TextFormField( 
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
              validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      } else if (value.length < 10) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
            ),
            SizedBox(height: 20,),
              
              TextFormField(
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
              validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                          .hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
            ),
            SizedBox(height: 20,),
              
              TextFormField( 
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
              validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 50,
            child:  FloatingActionButton(
                      onPressed: isButtonEnabled
                          ? () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Playerprofile()),
                                );
                              }
                            }
                          : null,
                      backgroundColor: isButtonEnabled
                          ? Colors.blue
                          : Colors.grey, // ✅ Disable button when invalid
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'SignUp',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}