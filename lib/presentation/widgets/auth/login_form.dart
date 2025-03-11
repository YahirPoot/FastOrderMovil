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
    final registerBloc = context.watch<RegisterBloc>();
    final email = registerBloc.state.email;
    final password = registerBloc.state.password;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) { //Escucha los cambios de estado del bloc
        if (state.isLoggedIn) {
          context.go('/');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          child: Column(
            children: [
              const Spacer(flex: 1),
              Text('Login', style: titleColorApppF24),
              const Spacer(flex: 1),
              CustomTextFormField(
                width: sizeWidth * 0.7,
                label: "Correo",
                hint: "Ingresa tu correo",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                color: const Color(0xFFF48C06),
                textStyle: descriptionOrangeF14,
                onChanged: (value) => registerBloc.add(UpdateEmail(value)),
                errorMessage: email.errorMessage,
              ),
              const SizedBox(height: 35),
              CustomTextFormField(
                width: sizeWidth * 0.7,
                label: 'Contraseña',
                hint: 'Ingresa tu contraseña',
                icon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                color: const Color(0xFFF48C06),
                obscureText: true,
                textStyle: descriptionOrangeF14,
                onChanged: (value) => registerBloc.add(UpdatePassword(value)),
                errorMessage: password.errorMessage,
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: sizeWidth * 0.7,
                height: 50,
                child: CustomFilledButtomn(
                  text: 'Iniciar Sesión',
                  buttonColor: const Color(0xFFF48C06),
                  onPressed: () {
                    registerBloc.add(SubmitForm());
                  },
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
