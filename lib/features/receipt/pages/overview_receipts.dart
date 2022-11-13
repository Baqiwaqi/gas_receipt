import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_receipt/features/receipt/bloc/receipt_bloc.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            const Text('Overview Receipts'),
            BlocBuilder<ReceiptBloc, ReceiptState>(
              builder: (context, state) {
                if (state is ReceiptsLoaded) {
                  if (state.receipts.isEmpty) {
                    return const Text('No receipts');
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.receipts.length,
                      itemBuilder: (context, index) {
                        final receipt = state.receipts[index];
                        return ListTile(
                          title: Text(receipt.gasDate.toString()),
                          subtitle: Text(receipt.total.toString()),
                        );
                      },
                    ),
                  );
                }
                if (state is ReceiptsLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is ReceiptsNotLoaded) {
                  return const Text('No receipts');
                }
                return const Text('No receipts');
              },
            ),
          ],
        ),
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
