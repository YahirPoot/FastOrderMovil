import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/bloc/register_form_bloc/register_form_bloc.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => RegisterFormBloc(authBloc: context.read<AuthBloc>()),
        child: Stack(
          children: [
            // Cabecera naranja Fija
            Container(
              height: size.height * 0.5,
              width: double.infinity,
              color: const Color(0xFFF48C06), //TODO: MANAGE COLORS
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LoginIcon(size: size)
                ],
              ),
            ),

            // Cuerpo scrollable con formulario, fondo blanco
            Align(
              alignment: Alignment.bottomCenter,
              child: FormContainer(
                height: size.height * 0.68,
                loginForm: LoginForm()
                )
            ),
          ],
        ),
      ),
    );
  }
}
