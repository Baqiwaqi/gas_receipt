import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});
  static Page page() => const MaterialPage<void>(child: ReceiptPage());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('ReceiptPage'),
    );
  }
}
