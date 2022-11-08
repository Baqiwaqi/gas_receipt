import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: StatisticsPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Text("Statistics"),
    );
  }
}
