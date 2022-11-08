import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_receipt/config/themes/constants.dart';
import 'package:gas_receipt/routes/app_routes.dart';
import 'package:gas_receipt/routes/bloc/app_routes_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline5;

    return BlocProvider(
      create: (context) => RoutesBloc(),
      child: HomeView(textTheme: textTheme),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextStyle? textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlowBuilder(
        state: context.select((RoutesBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      bottomNavigationBar: BlocBuilder<RoutesBloc, RoutesState>(
        builder: (context, state) {
          return Container(
            color: appBarColor,
            child: SalomonBottomBar(
              currentIndex: state.index,
              onTap: (i) =>
                  context.read<RoutesBloc>().add(RoutesChanged(index: i)),
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedColor: tabbarItemColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.bar_chart, color: iconColor),
                  title: const Text("Statistics"),
                  selectedColor: tabbarItemColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings, color: iconColor),
                  title: const Text("Settings"),
                  selectedColor: tabbarItemColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
