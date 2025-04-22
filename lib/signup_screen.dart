import 'package:flutter/material.dart';
import 'package:travel_app/profile_screen.dart';
import 'package:travel_app/utils/imageResources.dart';
import 'package:travel_app/utils/string.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';
import 'bottom_navigation_screen.dart';
import 'main.dart';

class signupScreen extends StatefulWidget {
  @override
  State<signupScreen> createState() => _SignUpState();
}

class _SignUpState extends State<signupScreen> {
  final _formKey = GlobalKey<FormState>();

  var userController = TextEditingController();
  var emailVal = TextEditingController();
  var passwordVal = TextEditingController();
  var confirmPassVal = TextEditingController();

  bool showPassword = true;
  bool confirmShowPassword = true;

  bool isValid(String email) {
    String pattern =
        emailValRegex;
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text(signUpText)),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    createAcc,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return userValidator;
                    }
                  },
                  controller: userController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: user,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return emailValidator;
                    }
                  },
                  controller: emailVal,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: emailText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return passValidator;
                    }
                  },
                  controller: passwordVal,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword?Icons.visibility:Icons.visibility_off),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: passText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: confirmPassVal,
                  obscureText: confirmShowPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmShowPassword = !confirmShowPassword;
                        });
                      },
                      icon:Icon(confirmShowPassword?Icons.visibility:Icons.visibility_off),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: confirmPass,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      String user = userController.text.toString();
                      String email = emailVal.text.toString();
                      String pass = passwordVal.text.toString();
                      String confirmPass = confirmPassVal.text.toString();

                      print(
                        "Username : ${userController.text}, Email : ${emailVal.text}",
                      );
                      if (pass != confirmPass) {
                        toastification.show(
                          title: Text(passNotMatch),
                          type: ToastificationType.error,
                          autoCloseDuration: const Duration(seconds: 3),
                          alignment: Alignment.topCenter,
                        );
                      } else {
                        print("Password : ${passwordVal.text}");
                      }
                      if (_formKey.currentState!.validate()) {}

                      if (!isValid(email) && emailVal.text.isNotEmpty) {
                        // Fluttertoast.showToast(
                        //   msg: invalidEmail,
                        //   gravity: ToastGravity.TOP,
                        //   backgroundColor: Colors.black,
                        //   fontSize: 15,
                        // );

                        toastification.show(
                          title: Text(invalidEmail),
                          type: ToastificationType.warning,
                          autoCloseDuration: const Duration(seconds: 3),
                          alignment: Alignment.topCenter,
                        );
                      }

                      if(isValid(email)&&email.isNotEmpty&&(pass==confirmPass)&&user.isNotEmpty){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                bottomNavigationbarScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(signUp, style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                Divider(thickness: 2, color: Colors.black, height: 50),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple, color: Colors.black),
                        SizedBox(width: 8),
                        Text(appleLog, style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(google_icon, width: 24, height: 20),
                        SizedBox(width: 8),
                        Text(googleLog, style: TextStyle(color: Colors.black)),
                      ],
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
