import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {

  const ResponsiveText({
    super.key,
    required this.text,
    this.style,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final double minFontSize;
  final double maxFontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
  
}