

import 'dart:convert';

import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';

class PeriodModel extends PeriodEntity {

  const PeriodModel({
    String? periodId,
    int? lengthSeconds,
    int? lengthMonths,
    int? unitCount,
    String? unitName,
    String? displayName,
}) : super(
    periodId: periodId,
    lengthSeconds: lengthSeconds,
    lengthMonths: lengthMonths,
    unitCount: unitCount,
    unitName: unitName,
    displayName: displayName,
  );

  factory PeriodModel.fromJson(String str) => PeriodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeriodModel.fromMap(Map<String, dynamic> json) => PeriodModel(
    periodId: json["period_id"],
    lengthSeconds: json["length_seconds"],
    lengthMonths: json["length_months"],
    unitCount: json["unit_count"],
    unitName: json["unit_name"],
    displayName: json["display_name"],
  );

  Map<String, dynamic> toMap() => {
    "period_id": periodId,
    "length_seconds": lengthSeconds,
    "length_months": lengthMonths,
    "unit_count": unitCount,
    "unit_name": unitName,
    "display_name": displayName,
  };

  PeriodEntity toPeriodEntity() => PeriodEntity(
    periodId: periodId,
    lengthSeconds: lengthSeconds,
    lengthMonths: lengthMonths,
    unitCount: unitCount,
    unitName: unitName,
    displayName: displayName,
  );
}