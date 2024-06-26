import 'package:flutter/material.dart';

import '../../../shared/themes/theme.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController controller;

  const EmailInput({super.key, required this.controller});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextFormField(
          controller: widget.controller,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            iconColor: secondaryColor,
            labelText: 'E-mail',
            labelStyle: TextStyle(
              color: secondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder
                .none, // removes default underline decoration
            errorStyle: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.w600,),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Proszę podać swojego emaila';
            }
            return null;
          },
        ),
      ),
    );
  }
}
