import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gas_receipt/features/receipt/model/receipt_model.dart';

class ReceiptRepository {
  final receiptCollection = FirebaseFirestore.instance
      .collection('receipts')
      .withConverter(
        fromFirestore: (snapshot, _) => GasReceipt.fromJson(snapshot.data()!),
        toFirestore: (file, _) => file.toJson(),
      );

  Future<void> createReceipt(GasReceipt receipt) async {
    await receiptCollection.add(receipt);
  }

  Future<void> updateReceipt(GasReceipt receipt) async {
    await receiptCollection.doc(receipt.id).set(receipt);
  }

  Future<void> deleteReceipt(GasReceipt receipt) async {
    await receiptCollection.doc(receipt.id).delete();
  }

  Future<List<GasReceipt>> getReceipts() async {
    final snapshot = await receiptCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<GasReceipt>> streamReceipts() {
    return receiptCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
