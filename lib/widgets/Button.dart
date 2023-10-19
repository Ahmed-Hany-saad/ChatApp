// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusttomButton extends StatelessWidget {
  String text1;
  VoidCallback onTab;
  dynamic buttoncolor;
  CusttomButton({required this.onTab, required this.text1, this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {
        onTab();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          buttoncolor ?? const Color.fromARGB(255, 255, 255, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.3),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03,
          horizontal: screenWidth * 0.08,
        ),
        child: Text(
          text1,
          style: TextStyle(
            color:const Color.fromARGB(255, 255, 255, 255),
            fontSize: screenWidth * 0.07,
          ),
        ),
      ),
    );
  }
}
