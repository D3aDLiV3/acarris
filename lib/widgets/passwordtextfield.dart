// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordTextField extends StatefulWidget {
  bool obscure;
  TextEditingController codigoTiendaController;
  double height;
  double width;

  PasswordTextField({
    Key? key,
    // required this.textField,
    required this.codigoTiendaController,
    required this.obscure,
    this.height = 60,
    this.width = 490,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width: 2)),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 3.0, bottom: 5, left: 20, right: 20),
        child: TextField(
          obscureText: widget.obscure,
          controller: widget.codigoTiendaController,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            border: InputBorder.none,
            hintText: 'Contraseña',
            focusColor: Colors.black,
            hoverColor: Colors.black,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.obscure = !widget.obscure;
                });
                setState(() {});
              },
              icon: widget.obscure
                  ? const Icon(FontAwesomeIcons.eyeSlash)
                  : const Icon(FontAwesomeIcons.eye),
            ),
          ),
        ),
      ),
    );
  }
}
