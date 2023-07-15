// ignore_for_file: file_names

import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/chatApp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../widgets/Button.dart';
import '../widgets/TextField.dart';

// ignore: camel_case_types
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static String id = "log in";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LogIn> createState() => _LogInState();
}

// ignore: camel_case_types
class _LogInState extends State<LogIn> {
  String? email;
  String? password;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimarycolor,
        body: Center(
          child: Form(
            key: LogIn._formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/scholar.png"),
                  Text(
                    "School Chat",
                    style: TextStyle(
                      fontFamily: "pacifico",
                      color: Colors.white,
                      fontSize: screenWidth * 0.09,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: screenWidth * 0.7,
                      top: screenWidth * 0.001,
                      bottom: screenWidth * 0.01,
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.03),
                  CustomTextField(
                    hint: "Email",
                    onchange: (data) {
                      email = data;
                    },
                  ),
                  SizedBox(height: screenWidth * 0.03),
                  CustomTextField(
                    hint: "Password",
                    onchange: (data) {
                      password = data;
                    },
                    obsecure: true,
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  CusttomButton(
                    onTab: () async {
                      isLoading = true;

                      if (LogIn._formKey.currentState!.validate()) {
                        await loginUser(email, password);
                      }
                      isLoading = false;
                    },
                    text1: "Log In",
                  ),
                  SizedBox(height: screenWidth * 0.034),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account ? ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            color: const Color.fromARGB(255, 102, 220, 253),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, register.id);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(
    BuildContext context,
    String snackBarText,
    Color color1,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackBarText,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color1,
      ),
    );
  }

  Future<void> loginUser(String? email, String? password) async {
    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // ignore: use_build_context_synchronously
        showSnackBar(
          context,
          "log in has been successfully completed",
          const Color.fromARGB(255, 54, 159, 1),
        );
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, ChatApp.id, arguments: email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackBar(
            context,
            "user not found",
            const Color.fromARGB(255, 204, 24, 24),
          );
        } else if (e.code == 'wrong-password') {
          showSnackBar(
            context,
            "Wrong Password",
            const Color.fromARGB(255, 204, 24, 24),
          );
        } else {
          showSnackBar(
            context,
            "Error occurred during log in",
            const Color.fromARGB(255, 204, 24, 24),
          );
        }
      }
    } else {
      showSnackBar(
        context,
        "Email and password are required",
        const Color.fromARGB(255, 204, 24, 24),
      );
    }
  }
}
