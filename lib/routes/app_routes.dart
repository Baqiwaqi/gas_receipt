import 'package:flutter/material.dart';
import 'package:gas_receipt/features/home/pages/home_page.dart';
import 'package:gas_receipt/features/receipt/pages/receipt_page.dart';
import 'package:gas_receipt/features/settings/pages/settings_page.dart';
import 'package:gas_receipt/features/statistics/pages/statistics_page.dart';
import 'package:gas_receipt/routes/bloc/app_routes_bloc.dart';

List<Page> onGenerateAppViewPages(
    RoutesStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case RoutesStatus.receiptRoute:
      return [ReceiptPage.page()];
    case RoutesStatus.statisticsRoute:
      return [StatisticsPage.page()];
    case RoutesStatus.settingsRoute:
      return [SettingsPage.page()];
  }
}
