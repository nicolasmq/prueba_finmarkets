import 'dart:convert';

import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';

class AssetOhlcvModel extends AssetOhlcvEntity {
  const AssetOhlcvModel({
    DateTime? timePeriodStart,
    DateTime? timePeriodEnd,
    DateTime? timeOpen,
    DateTime? timeClose,
    double? priceOpen,
    double? priceHigh,
    double? priceLow,
    double? priceClose,
    double? volumeTraded,
    int? tradesCount,
  }) : super(
          timePeriodStart: timePeriodStart,
          timePeriodEnd: timePeriodEnd,
          timeOpen: timeOpen,
          timeClose: timeClose,
          priceOpen: priceOpen,
          priceHigh: priceHigh,
          priceLow: priceLow,
          priceClose: priceClose,
          volumeTraded: volumeTraded,
          tradesCount: tradesCount,
        );

  factory AssetOhlcvModel.fromJson(String str) =>
      AssetOhlcvModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssetOhlcvModel.fromMap(Map<String, dynamic> json) => AssetOhlcvModel(
        timePeriodStart: json["time_period_start"] == null
            ? null
            : DateTime.parse(json["time_period_start"]),
        timePeriodEnd: json["time_period_end"] == null
            ? null
            : DateTime.parse(json["time_period_end"]),
        timeOpen: json["time_open"] == null
            ? null
            : DateTime.parse(json["time_open"]),
        timeClose: json["time_close"] == null
            ? null
            : DateTime.parse(json["time_close"]),
        priceOpen: json["price_open"]?.toDouble(),
        priceHigh: json["price_high"],
        priceLow: json["price_low"]?.toDouble(),
        priceClose: json["price_close"]?.toDouble(),
        volumeTraded: json["volume_traded"]?.toDouble(),
        tradesCount: json["trades_count"],
      );

  Map<String, dynamic> toMap() => {
        "time_period_start": timePeriodStart?.toIso8601String(),
        "time_period_end": timePeriodEnd?.toIso8601String(),
        "time_open": timeOpen?.toIso8601String(),
        "time_close": timeClose?.toIso8601String(),
        "price_open": priceOpen,
        "price_high": priceHigh,
        "price_low": priceLow,
        "price_close": priceClose,
        "volume_traded": volumeTraded,
        "trades_count": tradesCount,
      };

  AssetOhlcvEntity toAssetOhlcvEntity() => AssetOhlcvEntity(
        timePeriodStart: timePeriodStart,
        timePeriodEnd: timePeriodEnd,
        timeOpen: timeOpen,
        timeClose: timeClose,
        priceOpen: priceOpen,
        priceHigh: priceHigh,
        priceLow: priceLow,
        priceClose: priceClose,
        volumeTraded: volumeTraded,
        tradesCount: tradesCount,
      );
}
