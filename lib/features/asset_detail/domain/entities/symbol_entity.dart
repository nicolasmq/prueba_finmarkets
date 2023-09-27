

import 'package:equatable/equatable.dart';

class SymbolEntity extends Equatable {

  final String? symbolId;
  final String? exchangeId;
  final String? symbolType;
  final String? assetIdBase;
  final String? assetIdQuote;
  final String? assetIdUnit;
  final double? futureContractUnit;
  final String? futureContractUnitAsset;
  final DateTime? dataStart;
  final DateTime? dataEnd;
  final DateTime? dataQuoteStart;
  final DateTime? dataQuoteEnd;
  final DateTime? dataOrderbookStart;
  final DateTime? dataOrderbookEnd;
  final DateTime? dataTradeStart;
  final DateTime? dataTradeEnd;
  final double? volume1Hrs;
  final double? volume1HrsUsd;
  final double? volume1Day;
  final double? volume1DayUsd;
  final double? volume1Mth;
  final double? volume1MthUsd;
  final int? price;
  final String? symbolIdExchange;
  final String? assetIdBaseExchange;
  final String? assetIdQuoteExchange;
  final double? pricePrecision;
  final double? sizePrecision;

  const SymbolEntity({
    this.symbolId,
    this.exchangeId,
    this.symbolType,
    this.assetIdBase,
    this.assetIdQuote,
    this.assetIdUnit,
    this.futureContractUnit,
    this.futureContractUnitAsset,
    this.dataStart,
    this.dataEnd,
    this.dataQuoteStart,
    this.dataQuoteEnd,
    this.dataOrderbookStart,
    this.dataOrderbookEnd,
    this.dataTradeStart,
    this.dataTradeEnd,
    this.volume1Hrs,
    this.volume1HrsUsd,
    this.volume1Day,
    this.volume1DayUsd,
    this.volume1Mth,
    this.volume1MthUsd,
    this.price,
    this.symbolIdExchange,
    this.assetIdBaseExchange,
    this.assetIdQuoteExchange,
    this.pricePrecision,
    this.sizePrecision,
  });

  @override
  List<Object?> get props => [
    symbolId,
    exchangeId,
    symbolType,
    assetIdBase,
    assetIdQuote,
    assetIdUnit,
    futureContractUnit,
    futureContractUnitAsset,
    dataStart,
    dataEnd,
    dataQuoteStart,
    dataQuoteEnd,
    dataOrderbookStart,
    dataOrderbookEnd,
    dataTradeStart,
    dataTradeEnd,
    volume1Hrs,
    volume1HrsUsd,
    volume1Day,
    volume1DayUsd,
    volume1Mth,
    volume1MthUsd,
    price,
    symbolIdExchange,
    assetIdBaseExchange,
    assetIdQuoteExchange,
    pricePrecision,
    sizePrecision,
  ];
}