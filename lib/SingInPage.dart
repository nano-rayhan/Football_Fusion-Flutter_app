import 'package:flutter/material.dart';
import 'package:football_fusion/playerProfile.dart';
import 'package:football_fusion/registration.dart';

class PlayerSign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayerSignState();
  }
}

class _PlayerSignState extends State<PlayerSign> {
  TextEditingController pNumber = TextEditingController();
  TextEditingController pPassword = TextEditingController();

  bool showErrors = false; 
  bool isButtonEnabled = false;

  void checkForm() {
    setState(() {
      isButtonEnabled = _validateNumber(pNumber.text) && _validatePassword(pPassword.text);
    });
  }

  bool _validateNumber(String number) {
    return number.isNotEmpty && number.length == 11 && RegExp(r'^[0-9]+$').hasMatch(number);
  }

  bool _validatePassword(String password) {
    return password.isNotEmpty && password.length >= 6;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200], 
        appBar: AppBar(
          title: Text("Become a Player!"),
          backgroundColor: Colors.blueAccent,
        ),
        body:  
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text('Welcome to the app', style: TextStyle(color: Colors.grey[600])),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                TextField(
                  controller: pNumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                    errorText: showErrors
                        ? (!_validateNumber(pNumber.text) ? "Enter a valid 11-digit number" : null)
                        : null, 
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: pPassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                    errorText: showErrors
                        ? (!_validatePassword(pPassword.text) ? "Password must be at least 6 characters" : null)
                        : null, 
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showErrors = true; 
                        });

                        if (isButtonEnabled) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Playerprofile()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled ? Colors.blueAccent : Colors.grey, 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registration()),
                      );
                    },
                    child: Text(
                      'Create a new account',
                      style: TextStyle(decoration: TextDecoration.underline, fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
