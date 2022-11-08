part of 'receipt_routes_bloc.dart';

enum ReceiptRoutesStatus { overview, create, details }

class ReceiptRoutesState extends Equatable {
  const ReceiptRoutesState._({
    required this.status,
  });

  final ReceiptRoutesStatus status;

  @override
  List<Object> get props => [status];
}
