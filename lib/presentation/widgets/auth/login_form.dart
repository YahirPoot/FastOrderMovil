import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
            Spacer(flex: 1),
            Text('Login', style: titleColorApppF24),
            Spacer(flex: 1),
            CustomTextFormField(
              width: sizeWidth * 0.8,
              label: "Correo",
              hint: "Ingresa tu correo",
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.isEmpty ? "Este campo es obligatorio" : null,
            ),
            SizedBox(height: 35),
            CustomTextFormField(
              width: sizeWidth * 0.8,
              label: 'Contraseña',
              hint: 'Ingresa tu contraseña',
              icon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? "Este campo es obligatorio" : null,
            ),
            Spacer(flex: 1),
            SizedBox(
              width: sizeWidth * 0.8,
              height: 50,
              child: CustomFilledButtomn(
                text: 'Iniciar Sesión',
                buttonColor: Color(0xFFF48C06),
                onPressed: () {
                  context.read<AuthBloc>().add(LoginEvent());
                  context.go('/');
                },
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}