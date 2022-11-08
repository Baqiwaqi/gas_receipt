import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_receipt/routes/bloc/receipt_routes_bloc.dart';

class OverviewReceiptPage extends StatelessWidget {
  const OverviewReceiptPage({
    super.key,
  });

  static Page page() => const MaterialPage<void>(child: OverviewReceiptPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const Text("OverviewReceiptPage"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ReceiptRoutesBloc>()
              .add(const RoutesChanged(status: ReceiptRoutesStatus.create));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
