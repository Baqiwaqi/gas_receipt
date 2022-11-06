import 'package:flutter/widgets.dart';
import 'package:gas_receipt/features/authentication/bloc/auth_bloc.dart';
import 'package:gas_receipt/features/authentication/page/auth_page.dart';
import 'package:gas_receipt/features/home/home_page.dart';

List<Page> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomePage.page()];
    case AuthStatus.unauthenticated:
    default:
      return [AuthPage.page()];
  }
}
