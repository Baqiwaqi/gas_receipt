import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

class CreateReceiptPage extends StatelessWidget {
  const CreateReceiptPage({super.key});

  static Page page() => const MaterialPage<void>(child: CreateReceiptPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Text("CreateReceiptPage"),
    );
  }
}
