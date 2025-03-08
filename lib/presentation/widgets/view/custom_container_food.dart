import 'package:fast_order/config/index.dart';
import 'package:flutter/material.dart';

class CustomContainerFood extends StatelessWidget {
  final String text;
  final String imageUrl;
  const CustomContainerFood({
    super.key, 
    required this.text, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: subtitleBlackF16,
            )
          ],
        ),
      ),
    );
  }
}
