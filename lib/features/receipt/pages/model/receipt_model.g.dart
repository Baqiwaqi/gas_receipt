// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasReceipt _$GasReceiptFromJson(Map<String, dynamic> json) => GasReceipt(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      gasDate: json['gasDate'] == null
          ? null
          : DateTime.parse(json['gasDate'] as String),
      volume: (json['volume'] as num?)?.toDouble(),
      gasPrice: (json['gasPrice'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      btw: (json['btw'] as num?)?.toDouble(),
      netto: (json['netto'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GasReceiptToJson(GasReceipt instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'gasDate': instance.gasDate?.toIso8601String(),
      'volume': instance.volume,
      'gasPrice': instance.gasPrice,
      'total': instance.total,
      'btw': instance.btw,
      'netto': instance.netto,
    };
