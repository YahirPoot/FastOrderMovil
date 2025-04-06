import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget loginForm;
  final double height;
  const FormContainer({super.key, required this.loginForm, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // altura fija, no se mueve con teclado
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min, //?
          children: [
            SizedBox(height: 20),
            loginForm,
          ],
        ),
      ),
    );
  }
}