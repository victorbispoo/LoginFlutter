import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool esconderSenha;
  final TextInputType tipoTeclado;
  final String hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  const DefaultInput({super.key, required this.controller, required this.labelText,required this.esconderSenha, this.prefixIcon,this.suffixIcon,required this.tipoTeclado, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: esconderSenha,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}