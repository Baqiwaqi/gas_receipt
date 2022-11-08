part of 'receipt_routes_bloc.dart';

abstract class ReceiptRoutesEvent extends Equatable {
  const ReceiptRoutesEvent();

  @override
  List<Object> get props => [];
}

class RoutesChanged extends ReceiptRoutesEvent {
  const RoutesChanged({required this.status});

  final ReceiptRoutesStatus status;

  @override
  List<Object> get props => [status];
}
