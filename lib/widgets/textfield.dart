import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String? hint;
  Function(String)? onchange;
  bool? obsecure;
  dynamic icon;
  CustomTextField({
    super.key,
    this.hint,
    this.onchange,
    this.obsecure = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.94,
      child: TextFormField(
        obscureText: obsecure!,
        // ignore: body_might_complete_normally_nullable
        validator: (data) {
          if (data!.isEmpty) {
            return "This field is Required";
          }
        },
        onChanged: onchange,

        decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 248, 248, 248)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 247, 242, 242),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 42, 228, 48),
            ),
          ),
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: screenWidth * 0.06,
          ),
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.07,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
