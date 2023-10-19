import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/login.dart';
import 'package:flutter/material.dart';

import '../widgets/Button.dart';

// ignore: camel_case_types
class options extends StatefulWidget {
  const options({Key? key}) : super(key: key);
  static String id = "option id";

  @override
  State<options> createState() => _optionsState();
}

// ignore: camel_case_types
class _optionsState extends State<options> {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(children: [
          SizedBox(height: screenWidth * 0.29),
          SizedBox(
            width: screenWidth * 0.8,
            child: Image.asset(
                "assets/images/respage_chatbot_bubbletalk_dribbble.gif"),
          ),
          Text(
            "Welcome to",
            style:
                TextStyle(fontFamily: 'Pacifico', fontSize: screenWidth * 0.08),
          ),
          Text(
            "Chatting App",
            style: TextStyle(
                fontSize: screenWidth * 0.09, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenWidth * 0.065,
          ),
          CusttomButton(
            text1: "Sign In",
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>const LogIn()),
              );
            },
            buttoncolor:const Color(0xff2D88F4),
          ),
          SizedBox(
            height: screenWidth * 0.04,
          ),
          CusttomButton(
            text1: "Register",
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>const register()),
              );
            },
            buttoncolor:const Color.fromARGB(214, 39, 213, 172),
          ),
        ]),
      ),
    );
  }
}
