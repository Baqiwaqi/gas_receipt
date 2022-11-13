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
    on<LoadReceipts>(_onLoadReceipts);
    on<CreateReceipt>(_onCreateReceipt);
    on<UpdateReceipt>(_onUpdateReceipt);
    on<DeleteReceipt>(_onDeleteReceipt);
    on<UpdatedReceiptList>(_onUpdatedReceiptList);
  }

  final ReceiptRepository _receiptRepository;

  Future<void> _onLoadReceipts(LoadReceipts event, Emitter<ReceiptState> emit) {
    return emit.onEach<List<GasReceipt>>(_receiptRepository.streamReceipts(),
        onData: (receipts) => add(UpdatedReceiptList(receipts: receipts)));
  }

  void _onCreateReceipt(CreateReceipt event, Emitter<ReceiptState> emit) {
    _receiptRepository.createReceipt(event.receipt);
  }

  void _onUpdateReceipt(UpdateReceipt event, Emitter<ReceiptState> emit) {
    _receiptRepository.updateReceipt(event.receipt);
  }

  void _onDeleteReceipt(DeleteReceipt event, Emitter<ReceiptState> emit) {
    _receiptRepository.deleteReceipt(event.receipt);
  }

  void _onUpdatedReceiptList(
      UpdatedReceiptList event, Emitter<ReceiptState> emit) {
    emit(ReceiptsLoaded(receipts: event.receipts));
  }
}
