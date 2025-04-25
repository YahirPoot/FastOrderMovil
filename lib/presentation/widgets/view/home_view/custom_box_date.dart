import 'package:fast_order/config/index.dart';
import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {
  final double width;
  const CustomDate({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      width: width,
      decoration: BoxDecoration(
        color: colorList[0],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: ResponsiveText(
          text:'Miercoles 20 Septiembre',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            ),
            maxFontSize: 12,
            minFontSize: 8,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      ),
    );
  }
}