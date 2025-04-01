import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:fast_order/presentation/bloc/register_bloc/register_form_bloc.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final viewInsets = MediaQuery.of(context).viewInsets;
    final size = MediaQuery.of(context).size;

    _handleKeyboardVisibility(viewInsets, scrollController);

    return Scaffold(
      backgroundColor: const Color(0xFFF48C06),
      body: BlocProvider(
        create: (context) => RegisterFormBloc( authBloc: context.read<AuthBloc>() ),
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginIcon(size: size),
                FormContainer(loginForm: LoginForm()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleKeyboardVisibility(EdgeInsets viewInsets, ScrollController scrollController) {
    if (viewInsets.bottom > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          200,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      });
    }
  }

}