import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  ReceiptBloc() : super(ReceiptInitial()) {
    on<ReceiptEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
