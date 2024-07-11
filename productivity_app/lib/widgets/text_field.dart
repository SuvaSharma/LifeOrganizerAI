import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData? icon;
  final TextInputType textInputType;
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    this.icon,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //   child: TextField(
    //     style: const TextStyle(fontSize: 20),
    //     controller: textEditingController,
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(icon, color: Colors.black54),
    //       hintText: hintText,
    //       hintStyle: const TextStyle(color: Colors.black45, fontSize: 18),
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       border: InputBorder.none,
    //       filled: true,
    //       fillColor: const Color(0xFFedf0f8),
    //       contentPadding: const EdgeInsets.symmetric(
    //         vertical: 15,
    //         horizontal: 20,
    //       ),
    //     ),
    //     keyboardType: textInputType,
    //     obscureText: isPass,
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // color of shadow
              spreadRadius: 2, // spread radius
              blurRadius: 5, // blur radius
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: textEditingController,
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black.withOpacity(0.9)),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            labelText: hintText,
            labelStyle: TextStyle(
                color: Colors.grey.withOpacity(0.9),
                fontWeight: FontWeight.bold),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: textInputType,
          obscureText: isPass,
        ),
      ),
    );
  }
}
