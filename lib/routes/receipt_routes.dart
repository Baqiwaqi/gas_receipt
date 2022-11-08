import 'package:flutter/material.dart';

import 'package:gas_receipt/features/receipt/pages/create_receipt.dart';
import 'package:gas_receipt/features/receipt/pages/overview_receipts.dart';
import 'package:gas_receipt/features/receipt/pages/receipt_details.dart';
import 'package:gas_receipt/routes/bloc/receipt_routes_bloc.dart';

List<Page> onGenerateReceiptPages(
    ReceiptRoutesStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case ReceiptRoutesStatus.overview:
      return [OverviewReceiptPage.page()];
    case ReceiptRoutesStatus.create:
      return [CreateReceiptPage.page()];
    case ReceiptRoutesStatus.details:
      return [ReceiptDetailsPage.page()];
  }
}
