import 'package:flutter/material.dart';
import 'package:football_fusion/playerProfile.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationState();
  }
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController pName = TextEditingController();
  TextEditingController pNumber = TextEditingController();
  TextEditingController pEmail = TextEditingController();
  TextEditingController pPassword = TextEditingController();

  bool isButtonEnabled = false;
  bool isSubmitted = false; 

  void checkForm() {
    setState(() {
      isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    pName.addListener(checkForm);
    pNumber.addListener(checkForm);
    pEmail.addListener(checkForm);
    pPassword.addListener(checkForm);
  }

  @override
  void dispose() {
    pName.dispose();
    pNumber.dispose();
    pEmail.dispose();
    pPassword.dispose();
    super.dispose();
  }

  void submitForm() {
    setState(() {
      isSubmitted = true;
    });

    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PlayerProfile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Player Registration'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              autovalidateMode: isSubmitted
                  ? AutovalidateMode.always 
                  : AutovalidateMode.disabled, 
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Text('SignUp',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Welcome to the app'),
                      ],
                    ),
                  ),
                  buildTextField(pName, 'Enter your name', (value) {
                    if (isSubmitted && (value == null || value.isEmpty)) {
                      return "Name is required";
                    }
                    return null;
                  }),
                  SizedBox(height: 20),
                  buildTextField(pNumber, 'Enter your Phone number', (value) {
                    if (isSubmitted && (value == null || value.isEmpty)) {
                      return "Phone number is required";
                    } else if (isSubmitted && value!.length < 10) {
                      return "Enter a valid phone number";
                    }
                    return null;
                  }, TextInputType.number),
                  SizedBox(height: 20),
                  buildTextField(pEmail, 'Enter your Email', (value) {
                    if (isSubmitted && (value == null || value.isEmpty)) {
                      return "Email is required";
                    } else if (isSubmitted &&
                        !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                            .hasMatch(value!)) {
                      return "Enter a valid email";
                    }
                    return null;
                  }),
                  SizedBox(height: 20),
                  buildTextField(pPassword, 'Password', (value) {
                    if (isSubmitted && (value == null || value.isEmpty)) {
                      return "Password is required";
                    } else if (isSubmitted && value!.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  }, TextInputType.text,  true),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: submitForm,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'SignUp',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText,
      String? Function(String?) validator,
      [TextInputType keyboardType = TextInputType.text, bool isPassword = false]) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,
    );
  }
}