import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldLogin extends StatelessWidget {
  TextEditingController controller;
  double height;
  double width;

  double borderRadius;

  TextFieldLogin({
    Key? key,
    required this.controller,
    this.height = 60,
    this.width = 60,
    this.borderRadius = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.black, width: 2)),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 5, left: 20, right: 20),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            border: InputBorder.none,
            hintText: 'Usuario',
            focusColor: Colors.black,
            hoverColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
