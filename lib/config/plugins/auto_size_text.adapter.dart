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
    this.group,
    this.textScaleFactor,
  });

  final String text;
  final TextStyle? style;
  final double minFontSize;
  final double maxFontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final ResponsiveTextGroup? group;
  final double? textScaleFactor;

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
      textScaleFactor: textScaleFactor,
      group: group?._autoSizeGroup, //que es lo que hace este group?._autoSizeGroup?
    );
  }
  
}// Clase para manejar grupos de ResponsiveText
class ResponsiveTextGroup {
  final AutoSizeGroup _autoSizeGroup = AutoSizeGroup(); // Internamente usa AutoSizeGroup
}