import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  void showSnackbar( BuildContext context, String message ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final registerBloc = context.watch<RegisterFormBloc>();
    final email = registerBloc.state.email;
    final password = registerBloc.state.password;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) { //Escucha los cambios de estado del bloc
        // Cerrar el loading cuando el estado cambie
        if (state.authStatus != AuthStatus.checking) {
          Navigator.of(context, rootNavigator: true).pop(); // Cierra el diálogo
        }

        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          showSnackbar(context, state.errorMessage!);
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
                errorMessage: registerBloc.state.isFormPosted
                  ? email.errorMessage
                  : null,
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
                errorMessage: registerBloc.state.isFormPosted
                  ? password.errorMessage
                  : null,
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: sizeWidth * 0.7,
                height: 50,
                child: CustomFilledButtomn(
                  text: 'Iniciar Sesión',
                  buttonColor: const Color(0xFFF48C06),
                  onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false, // Evita que se cierre al hacer clic fuera
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFF48C06),
                      ),
                    ),
                  );

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
