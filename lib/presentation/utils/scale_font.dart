import 'dart:math';
import 'package:flutter/material.dart';

double scaleFont(double size, BuildContext context) {
      final screenSize = MediaQuery.of(context).size;
      final screenDiagonal = sqrt(screenSize.width * screenSize.width + screenSize.height * screenSize.height);
      final baseDiagonal = 942.4; // Usando tu teléfono como referencia
      final scaleFactor = screenDiagonal / baseDiagonal;
      // Limita el escalado
      final clampedScale = scaleFactor.clamp(0.90, 1.15); // por ejemplo
      return size * clampedScale;
    }
