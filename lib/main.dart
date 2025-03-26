import 'package:fast_order/app.dart';
import 'package:fast_order/config/constants/enviroment.dart';
import 'package:fast_order/providers.dart';
import 'package:flutter/material.dart';

void main() async {
  await Environment.initEnviroment();
  runApp(
    AppBlocProviders(main: MainApp()),
  );
}
