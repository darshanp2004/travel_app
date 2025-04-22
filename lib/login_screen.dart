import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/home_screen.dart';
import 'package:travel_app/bottom_navigation_screen.dart';
import 'package:travel_app/splash_screen.dart';
import 'package:travel_app/utils/imageResources.dart';
import 'package:travel_app/utils/string.dart';
import 'signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _LogInState();
}

class _LogInState extends State<loginScreen> {

  var EmailText = TextEditingController();
  var passwordText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  bool validEmail(String email) {
    String pattern =
        emailValRegex;
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.red,
        ),
        title: Text(login),
      ),
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
                    welcomeText,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(height: 50),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return emailValidator;
                    }
                  },
                  controller: EmailText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: hintText1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Container(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return passValidator;
                    }
                  },
                  controller: passwordText,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon:Icon(showPassword?Icons.visibility:Icons.visibility_off),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: passText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(forgotPass, textAlign: TextAlign.right),
                ),
                Container(height: 10),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: ()async  {
                      String email = EmailText.text.toString();
                      String pass = passwordText.text.toString();

                      if (validEmail(email)&&email.isNotEmpty&&pass.length>=8) {
                        var sharedpref=await SharedPreferences.getInstance();
                        sharedpref.setBool(SplashscreenState.KEYLOGIN, true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottomNavigationbarScreen(),
                          ),
                        );
                        print(
                          "$emailText: ${EmailText.text}, $passText: ${passwordText.text}",
                        );
                      }

                      if (_formKey.currentState!.validate()) {}

                      if (!validEmail(email) && email.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(invalidEmail),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }

                      if (pass.length < 8 &&
                          pass.isNotEmpty &&
                          email.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(invalidPass),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      login,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(height: 10),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signupScreen()),
                      );
                    },
                    child: Text(signUp, style: TextStyle(color: Colors.black)),
                  ),
                ),
                Divider(color: Colors.black, thickness: 2, height: 50),
                SizedBox(
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
                SizedBox(
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
