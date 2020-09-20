import 'package:flutter/material.dart';

class CardInputField extends StatelessWidget {
  const CardInputField({
    Key key,
    @required this.icon,
    @required this.controller,
    @required this.placeholder,
    this.type = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  final IconData icon;
  final bool isPassword;
  final String placeholder;
  final TextInputType type;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextField(
          controller: controller,
          autocorrect: false,
          obscureText: isPassword,
          keyboardType: type,
          decoration: InputDecoration(
            hintText: placeholder,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(icon),
            contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          ),
        ),
      ),
    );
  }
}
