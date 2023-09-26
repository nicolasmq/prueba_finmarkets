import 'dart:convert';

import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    String? assetId,
    String? name,
    int? typeIsCrypto,
    DateTime? dataQuoteStart,
    DateTime? dataQuoteEnd,
    DateTime? dataOrderbookStart,
    DateTime? dataOrderbookEnd,
    DateTime? dataTradeStart,
    DateTime? dataTradeEnd,
    int? dataSymbolsCount,
    double? volume1HrsUsd,
    double? volume1DayUsd,
    int? volume1MthUsd,
    String? idIcon,
    DateTime? dataStart,
    DateTime? dataEnd,
  }) : super(
          assetId: assetId,
          name: name,
          volume1MthUsd: volume1MthUsd,
          volume1HrsUsd: volume1HrsUsd,
          volume1DayUsd: volume1DayUsd,
          typeIsCrypto: typeIsCrypto,
          idIcon: idIcon,
          dataTradeStart: dataTradeStart,
          dataTradeEnd: dataTradeEnd,
          dataSymbolsCount: dataSymbolsCount,
          dataStart: dataStart,
          dataQuoteStart: dataQuoteStart,
          dataQuoteEnd: dataQuoteEnd,
          dataOrderbookStart: dataOrderbookStart,
          dataOrderbookEnd: dataOrderbookEnd,
          dataEnd: dataEnd,
        );

  factory AssetModel.fromJson(String str) => AssetModel.fromMap(json.decode(str));

  factory AssetModel.fromMap(Map<String, dynamic> json) => AssetModel(
    assetId: json["asset_id"],
    name: json["name"],
    typeIsCrypto: json["type_is_crypto"],
    dataQuoteStart: json["data_quote_start"] == null ? null : DateTime.parse(json["data_quote_start"]),
    dataQuoteEnd: json["data_quote_end"] == null ? null : DateTime.parse(json["data_quote_end"]),
    dataOrderbookStart: json["data_orderbook_start"] == null ? null : DateTime.parse(json["data_orderbook_start"]),
    dataOrderbookEnd: json["data_orderbook_end"] == null ? null : DateTime.parse(json["data_orderbook_end"]),
    dataTradeStart: json["data_trade_start"] == null ? null : DateTime.parse(json["data_trade_start"]),
    dataTradeEnd: json["data_trade_end"] == null ? null : DateTime.parse(json["data_trade_end"]),
    dataSymbolsCount: json["data_symbols_count"],
    volume1HrsUsd: json["volume_1hrs_usd"]?.toDouble(),
    volume1DayUsd: json["volume_1day_usd"]?.toDouble(),
    volume1MthUsd: json["volume_1mth_usd"],
    idIcon: json["id_icon"],
    dataStart: json["data_start"] == null ? null : DateTime.parse(json["data_start"]),
    dataEnd: json["data_end"] == null ? null : DateTime.parse(json["data_end"]),
  );

  Map<String, dynamic> toMap() => {
    "asset_id": assetId,
    "name": name,
    "type_is_crypto": typeIsCrypto,
    "data_quote_start": dataQuoteStart?.toIso8601String(),
    "data_quote_end": dataQuoteEnd?.toIso8601String(),
    "data_orderbook_start": dataOrderbookStart?.toIso8601String(),
    "data_orderbook_end": dataOrderbookEnd?.toIso8601String(),
    "data_trade_start": dataTradeStart?.toIso8601String(),
    "data_trade_end": dataTradeEnd?.toIso8601String(),
    "data_symbols_count": dataSymbolsCount,
    "volume_1hrs_usd": volume1HrsUsd,
    "volume_1day_usd": volume1DayUsd,
    "volume_1mth_usd": volume1MthUsd,
    "id_icon": idIcon,
    "data_start": "${dataStart!.year.toString().padLeft(4, '0')}-${dataStart!.month.toString().padLeft(2, '0')}-${dataStart!.day.toString().padLeft(2, '0')}",
    "data_end": "${dataEnd!.year.toString().padLeft(4, '0')}-${dataEnd!.month.toString().padLeft(2, '0')}-${dataEnd!.day.toString().padLeft(2, '0')}",
  };
}
