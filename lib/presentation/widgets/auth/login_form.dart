import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (state.authStatus != AuthStatus.checking) {
          Navigator.of(context, rootNavigator: true).pop(); // Cierra el diálogo si es estado no esta en checking
        }

        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) { // Si hay un mensaje de error se muestra
          showSnackbar(context, state.errorMessage!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Login', style: titleColorApppF24),
              const SizedBox(height: 45),
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
              const SizedBox(height: 40),
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
              const SizedBox(height: 35),
              SizedBox(
                width: sizeWidth * 0.7,
                height: 50,
                child: CustomFilledButtomn(
                  text: 'Iniciar Sesión',
                  buttonColor: const Color(0xFFF48C06),
                  onPressed: registerBloc.state.isPosting ? null 
                  : () {
                    showDialog( //*ejecuta esto la primera vez, ya que es estado del register bloc no es posting
                    context: context,
                    barrierDismissible: false, // Evita que se cierre al hacer clic fuera
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFF48C06),
                      ),
                    ),
                  );

                    registerBloc.add(SubmitForm()); //*al ejecutar esto la primer vez, el estado del manda a isFormPosted a true y su es valido manda el is posting.
                  }
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
