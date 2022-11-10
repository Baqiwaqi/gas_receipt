import 'package:json_annotation/json_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class GasReceipt {
  GasReceipt({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.gasDate,
    this.volume,
    this.gasPrice,
    this.total,
    this.btw,
    this.netto,
  });

  @JsonKey(ignore: true)
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? gasDate;
  double? volume;
  double? gasPrice;
  double? total;
  double? btw;
  double? netto;

  factory GasReceipt.fromJson(Map<String, dynamic> json) =>
      _$GasReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$GasReceiptToJson(this);

  void setDocId(String docId) {
    id = docId;
  }

  GasReceipt copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? gasDate,
    double? volume,
    double? gasPrice,
    double? total,
    double? btw,
    double? netto,
  }) {
    return GasReceipt(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      gasDate: gasDate ?? this.gasDate,
      volume: volume ?? this.volume,
      gasPrice: gasPrice ?? this.gasPrice,
      total: total ?? this.total,
      btw: btw ?? this.btw,
      netto: netto ?? this.netto,
    );
  }
}
