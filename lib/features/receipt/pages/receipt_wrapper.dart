import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_receipt/routes/bloc/receipt_routes_bloc.dart';
import 'package:gas_receipt/routes/receipt_routes.dart';

class ReceiptWrapper extends StatelessWidget {
  const ReceiptWrapper({super.key});

  static Page page() => const MaterialPage<void>(child: ReceiptWrapper());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ReceiptRoutesBloc>(
        create: (_) => ReceiptRoutesBloc(),
      ),
    ], child: _ReceiptWrapper());
  }
}

class _ReceiptWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: context.select((ReceiptRoutesBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateReceiptPages,
    );
  }
}
