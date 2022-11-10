import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gas_receipt/features/receipt/model/receipt_model.dart';
import 'package:gas_receipt/features/receipt/receipt_repository.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  ReceiptBloc({required ReceiptRepository receiptRepository})
      : _receiptRepository = receiptRepository,
        super(ReceiptsLoading()) {
    on<ReceiptEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final ReceiptRepository _receiptRepository;

  Future<void> _onLoadReceipts(LoadReceipts event, Emitter<ReceiptState> emit) {
    return emit.onEach<List<GasReceipt>>(_receiptRepository.streamReceipts(),
        onData: (receipts) => add(UpdatedReceiptList(receipts: receipts)));
  }
}
