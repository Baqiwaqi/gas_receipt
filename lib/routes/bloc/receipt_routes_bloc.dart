import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'receipt_routes_event.dart';
part 'receipt_routes_state.dart';

class ReceiptRoutesBloc extends Bloc<ReceiptRoutesEvent, ReceiptRoutesState> {
  ReceiptRoutesBloc()
      : super(
             ReceiptRoutesState._(status: ReceiptRoutesStatus.overview)) {
    on<RoutesChanged>(_onRoutesChanged);
  }
}

void _onRoutesChanged(RoutesChanged event, Emitter<ReceiptRoutesState> emit) {
  switch (event.status) {
    case ReceiptRoutesStatus.overview:
      emit(const ReceiptRoutesState._(status: ReceiptRoutesStatus.overview));
      break;
    case ReceiptRoutesStatus.create:
      emit(const ReceiptRoutesState._(status: ReceiptRoutesStatus.create));
      break;
    case ReceiptRoutesStatus.details:
      emit(const ReceiptRoutesState._(status: ReceiptRoutesStatus.details));
      break;
  }
}
