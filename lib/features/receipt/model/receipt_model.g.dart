// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasReceipt _$GasReceiptFromJson(Map<String, dynamic> json) => GasReceipt(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      gasDate: json['gasDate'] as String?,
      volume: (json['volume'] as num?)?.toDouble(),
      gasPrice: (json['gasPrice'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      btw: (json['btw'] as num?)?.toDouble(),
      netto: (json['netto'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GasReceiptToJson(GasReceipt instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'gasDate': instance.gasDate,
      'volume': instance.volume,
      'gasPrice': instance.gasPrice,
      'total': instance.total,
      'btw': instance.btw,
      'netto': instance.netto,
    };
