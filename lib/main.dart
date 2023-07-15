import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/chatApp.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat());
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
      },
      initialRoute: LogIn.id,
    );
  }
}
