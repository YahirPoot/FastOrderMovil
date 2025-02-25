import 'package:fast_order/config/themes/font/font_styles.dart';
import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/widgets/shared/custom_filled_buttom.dart';
import 'package:fast_order/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    final sizeWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isLoggedIn) {
            context.go('/');
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Login', style: titleColorApppF24,),
              SizedBox(
                height: 90,
              ),
              CustomTextFormField(
                label: "Correo",
                hint: "Ingresa tu correo",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                label: 'Contraseña',
                hint: 'Ingresa tu contraseña',
                icon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: sizeWidth * 0.8 * 0.8,
                height: 50,
                child: CustomFilledButtomn(
                  text: 'Iniciar Sesión',
                  buttonColor: Color(0xFFF48C06),
                  onPressed: () {
                    context.read<AuthBloc>().add(LoginEvent());
                    context.go('/');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
