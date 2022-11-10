part of 'receipt_bloc.dart';

abstract class ReceiptEvent extends Equatable {
  const ReceiptEvent();

  @override
  List<Object> get props => [];
}

class LoadReceipts extends ReceiptEvent {}

class UpdatedReceiptList extends ReceiptEvent {
  const UpdatedReceiptList({required this.receipts});

  final List<GasReceipt> receipts;

  @override
  List<Object> get props => [receipts];
}

class CreateReceipt extends ReceiptEvent {
  const CreateReceipt({required this.receipt});
  final GasReceipt receipt;

  @override
  List<Object> get props => [receipt];
}

class UpdateReceipt extends ReceiptEvent {
  const UpdateReceipt({required this.receipt});
  final GasReceipt receipt;

  @override
  List<Object> get props => [receipt];
}

class DeleteReceipt extends ReceiptEvent {
  const DeleteReceipt({required this.receipt});
  final GasReceipt receipt;

  @override
  List<Object> get props => [receipt];
}
