import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_receipt/features/authentication/cubit/auth_screen_cubit.dart';
import 'package:gas_receipt/features/authentication/widgets/login_view.dart';

import '../model/login_model.dart';
import '../widgets/register_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AuthPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Login')),
        body: BlocBuilder<AuthScreenCubit, AuthScreenState>(
      builder: (context, state) {
        if (state is AuthScreenLogin) {
          return LoginView(login: LoginModel(), isVisible: true);
        }

        if (state is AuthScreenLoginVisibility) {
          return LoginView(login: state.login, isVisible: state.isVisible);
        }

        if (state is AuthScreenRegister) {
          return RegisterView(register: RegisterModel(), isVisible: true);
        }

        if (state is AuthScreenRegisterVisibility) {
          return RegisterView(
              register: state.register, isVisible: state.isVisible);
        }

        if (state is LoginFailure) {
          return LoginView(
              login: LoginModel(),
              isVisible: true,
              errorMessage: state.message);
        }
        if (state is RegisterFailure) {
          return RegisterView(
              register: RegisterModel(),
              isVisible: true,
              errorMessage: state.message);
        }

        return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()));
      },
    ));
  }
}
