import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/chatApp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/Button.dart';
import '../widgets/TextField.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static String id = "log in";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LogIn> createState() => _LogInState();
}

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
        backgroundColor: const Color(0xFFFDFDFD),
        body: Center(
          child: Form(
            key: LogIn._formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenWidth * 0.05,
                  ),
                  SizedBox(
                    height: screenWidth * 0.6,
                    child: Image.asset("assets/images/ezgif-4-bee73b0862.gif"),
                  ),
                  SizedBox(
                    height: screenWidth * 0.03,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: screenWidth * 0.09,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.07),
                  CustomTextField(
                    icon:const Icon(Icons.email_outlined),
                    icon2:const Icon(Icons.close_rounded),
                    hint: "Email",
                    onchange: (data) {
                      email = data;
                    },
                  ),
                  SizedBox(height: screenWidth * 0.045),
                  CustomTextField(
                    icon:const Icon(Icons.lock_outline),
                    hint: "Password",
                    icon2: const Icon(Icons.remove_red_eye),
                    onchange: (data) {
                      password = data;
                    },
                    obsecure: true,
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  CusttomButton(
                    buttoncolor:const Color(0xff2D88F4),
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
                        "Don't have an account ? ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            color:const Color.fromARGB(192, 0, 98, 218),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>const register()),
                          );
                        },
                        onDoubleTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>const register()),
                          );
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
          "Log in has been successfully completed",
          const Color.fromARGB(255, 54, 159, 1),
        );
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, ChatApp.id, arguments: email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackBar(
            context,
            "User not found",
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
