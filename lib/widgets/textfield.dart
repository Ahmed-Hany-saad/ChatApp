import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  String? hint;
  Function(String)? onchange;
  bool? obsecure;
  dynamic icon;
  dynamic icon2;

  CustomTextField({
    Key? key,
    required this.hint,
    required this.onchange,
    this.obsecure = false,
    required this.icon,
    required this.icon2,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController  _controller = TextEditingController();

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.94,
      child: TextFormField(
        obscureText: widget.obsecure!,
        controller: _controller,
        validator: (data) {
          if (data!.isEmpty) {
            return "This field is Required";
          }
          return null;
        },
        onChanged: widget.onchange,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          suffixIcon: (widget.hint == "Email")
              ? IconButton(
                  onPressed: clearTextField,
                  icon: const Icon(Icons.close_rounded),
                )
              : GestureDetector(
                  onTap: () {
                    toggleIcon();
                  },
                  child: widget.icon2,
                ),
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(screenWidth * 0.07), // Set border radius
            borderSide:const BorderSide(color: Color.fromARGB(255, 3, 3, 3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Set border radius
            borderSide:const BorderSide(
              color: Color.fromARGB(255, 30, 183, 0),
            ),
          ),
          hintStyle: TextStyle(
            color:const Color.fromARGB(255, 0, 0, 0),
            fontSize: screenWidth * 0.06,
          ),
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.07,
          color:const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  void clearTextField() {
    _controller.clear();
  }

  void toggleIcon() {
    setState(() {
      clicked = !clicked;
      if (clicked) {
        widget.obsecure = false;
        widget.icon2 =const Icon(Icons.visibility_off);
      } else {
        widget.obsecure = true;
        widget.icon2 =const Icon(Icons.remove_red_eye);
      }
    });
  }
}
