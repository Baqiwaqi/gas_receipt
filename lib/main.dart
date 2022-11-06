import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gas_receipt/app_widget.dart';
import 'package:gas_receipt/features/authentication/repositories/auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(
    AppWidget(authenticationRepository: authenticationRepository),
  );
}
