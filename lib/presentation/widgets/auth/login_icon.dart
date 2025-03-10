import 'package:flutter/material.dart';

class LoginIcon extends StatelessWidget {
  const LoginIcon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.09),
      child: Center(
        child: AnimatedScale(
          scale: 1.15,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(24),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}