part of 'receipt_bloc.dart';

abstract class ReceiptEvent extends Equatable {
  const ReceiptEvent();

  @override
  List<Object> get props => [];
}

class LoadReceipts extends ReceiptEvent {}

class UpdatedReceipts extends ReceiptEvent {
  const UpdatedReceipts(this.receipts);
  final List<GasReceipt> receipts;

  @override
  List<Object> get props => [receipts];
}

class CreateReceipt extends ReceiptEvent {
  const CreateReceipt(this.receipt);
  final GasReceipt receipt;

  @override
  List<Object> get props => [receipt];
}

class UpdateReceipt extends ReceiptEvent {
  const UpdateReceipt(this.receipt);
  final GasReceipt receipt;

  @override
  List<Object> get props => [receipt];
}

class DeleteReceipt extends ReceiptEvent {
  const DeleteReceipt(this.receipt);
  final GasReceipt receipt;

  @override
  List<Object> get props => [receipt];
}
