part of 'receipt_bloc.dart';

abstract class ReceiptState extends Equatable {
  const ReceiptState();

  @override
  List<Object> get props => [];
}

class ReceiptsLoading extends ReceiptState {}

class ReceiptsLoaded extends ReceiptState {
  const ReceiptsLoaded({required this.receipts});

  final List<GasReceipt> receipts;

  @override
  List<Object> get props => [receipts];
}

class ReceiptsNotLoaded extends ReceiptState {}
