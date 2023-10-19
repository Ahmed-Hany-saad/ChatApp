import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/chatApp.dart';
import 'package:chat_app/pages/options.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat());
}

// ignore: camel_case_types
class splachscreen extends StatelessWidget {
  const splachscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/respage_chatbot_bubbletalk_dribbble.gif"),
          Text(
            "Chatting App",
            style:
                TextStyle(fontSize: screenWidth * 0.09, fontFamily: "Lobster"),
          )
        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: const options(),
      splashIconSize: screenWidth * 1,
      duration: 8000,
    );
  }
}

// ignore: camel_case_types
class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        register.id: (context) => const register(),
        LogIn.id: (context) => const LogIn(),
        ChatApp.id: (context) => const ChatApp(),
        options.id: (context) => const options(),
      },
      home:const splachscreen(),
    );
  }
}
