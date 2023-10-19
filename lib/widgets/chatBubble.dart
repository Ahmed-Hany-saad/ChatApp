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
        top: screenWidth * 0,
        end: screenWidth * 0.08,
        bottom: screenWidth * 0.02,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.015, top: screenWidth * 0.09),
              child: CircleAvatar(
                maxRadius: screenWidth * 0.05,
                child: Image.network(
                    "https://cdn4.iconfinder.com/data/icons/avatar-circle-1-1/72/71-512.png"),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minWidth: screenWidth * 0.15, // Set a minimum width
                maxWidth: screenWidth * 0.75, // Set a maximum width
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.1),
                  topRight: Radius.circular(screenWidth * 0.1),
                  bottomRight: Radius.circular(screenWidth * 0.1),
                ),
                color:
                    KPrimarycolor, // Set sender's messages color (e.g., blue)
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.03,
                  top: screenWidth * 0.03,
                  bottom: screenWidth * 0.03,
                ),
                child: Text(
                  messages.message,
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    color:const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
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
        child: Row(
          children: [
            const Spacer(flex: 1),
            Container(
              constraints: BoxConstraints(
                minWidth: screenWidth * 0.15, // Set a minimum width
                maxWidth: screenWidth * 0.53,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(screenWidth * 0.1),
                    topLeft: Radius.circular(screenWidth * 0.1),
                    bottomLeft: Radius.circular(screenWidth * 0.1)),
                color:const Color.fromARGB(255, 255, 255,
                    255), // Set receiver's messages color (e.g., pink)
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: screenWidth * 0.05,
                  left: screenWidth * 0.03,
                  bottom: screenWidth * 0.03,
                  top: screenWidth * 0.03,
                ),
                child: Text(
                  messages.message,
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    color: KPrimarycolor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.015, top: screenWidth * 0.09),
              child: CircleAvatar(
                maxRadius: screenWidth * 0.05,
                child: Image.network(
                    "https://cdn4.iconfinder.com/data/icons/avatar-circle-1-1/72/74-512.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
