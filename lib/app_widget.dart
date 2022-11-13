import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gas_receipt/config/themes/theme.dart';
import 'package:gas_receipt/features/authentication/bloc/auth_bloc.dart';
import 'package:gas_receipt/features/authentication/cubit/auth_screen_cubit.dart';
import 'package:gas_receipt/features/authentication/repositories/auth_repository.dart';
import 'package:gas_receipt/features/receipt/receipt_repository.dart';
import 'package:gas_receipt/routes/auth_routes.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider(
          create: (_) => ReceiptRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => AuthScreenCubit(_authenticationRepository),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Modular routing app",
      theme: AppTheme.light().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      home: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: FlowBuilder<AuthStatus>(
          state: context.select((AuthBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
