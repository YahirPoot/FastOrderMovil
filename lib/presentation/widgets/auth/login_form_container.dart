import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget loginForm;
  const FormContainer({super.key, required this.loginForm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        child: loginForm,
      ),
    );
  }
}