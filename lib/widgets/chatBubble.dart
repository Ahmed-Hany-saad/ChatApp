// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/messages.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final MessagesModel messages;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: screenWidth * 0.05,
        top: screenWidth * 0.02,
        end: screenWidth * 0.08,
        bottom: screenWidth * 0.02,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth * 0.12),
              topRight: Radius.circular(screenWidth * 0.07),
            ),
            color: KPrimarycolor, // Set sender's messages color (e.g., blue)
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.03,
              top: screenWidth * 0.05,
              bottom: screenWidth * 0.05,
            ),
            child: Text(
              messages.message,
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubblefriend extends StatelessWidget {
  const ChatBubblefriend({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final MessagesModel messages;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: screenWidth * 0.05,
        bottom: screenWidth * 0.03,
        start: screenWidth * 0.08,
        top: 0.0,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenWidth * 0.12),
              topLeft: Radius.circular(screenWidth * 0.07),
            ),
            color: const Color.fromARGB(
                255, 0, 132, 159), // Set receiver's messages color (e.g., pink)
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: screenWidth * 0.05,
              left: screenWidth * 0.03,
              bottom: screenWidth * 0.05,
              top: screenWidth * 0.05,
            ),
            child: Text(
              messages.message,
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
