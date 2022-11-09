part of 'receipt_bloc.dart';

abstract class ReceiptState extends Equatable {
  const ReceiptState();
  
  @override
  List<Object> get props => [];
}

class ReceiptInitial extends ReceiptState {}
