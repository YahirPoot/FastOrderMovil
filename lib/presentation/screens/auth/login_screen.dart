import 'package:fast_order/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF48C06),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Icon(
              Icons.person_pin,
              color: Colors.black,
              size: 100,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: size.height - 260,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100))),
              child: _LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text('Login'),
          SizedBox(
            height: 90,
          ),
          CustomTextFormField(
            label: "Correo",
            hint: "Ingresa tu correo",
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value!.isEmpty ? "Este campo es obligatorio" : null,
          ),

          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Contraseña',
            hint: 'Ingresa tu contraseña',
            icon: Icons.lock,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) => value!.isEmpty ? "Este campo es obligatorio" : null,
          ),
        ],
      ),
    );
  }
}
