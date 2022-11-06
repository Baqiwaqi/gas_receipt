import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_receipt/features/authentication/bloc/auth_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    // get authbloc
    final authBloc = context.read<AuthBloc>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: SignOutButton(authBloc: authBloc),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => Colors.redAccent),
          ),
          onPressed: () {
            authBloc.add(AuthLogoutRequest());
          },
          child: const Text("Uitloggen"),
        ),
      ),
    );
  }
}
