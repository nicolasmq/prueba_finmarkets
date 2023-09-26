import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable {
  final String? assetId;
  final String? name;
  final int? typeIsCrypto;
  final DateTime? dataQuoteStart;
  final DateTime? dataQuoteEnd;
  final DateTime? dataOrderbookStart;
  final DateTime? dataOrderbookEnd;
  final DateTime? dataTradeStart;
  final DateTime? dataTradeEnd;
  final int? dataSymbolsCount;
  final double? volume1HrsUsd;
  final double? volume1DayUsd;
  final int? volume1MthUsd;
  final String? idIcon;
  final DateTime? dataStart;
  final DateTime? dataEnd;
  final AssetIcon? icon;

  const AssetEntity({
    this.assetId,
    this.name,
    this.typeIsCrypto,
    this.dataQuoteStart,
    this.dataQuoteEnd,
    this.dataOrderbookStart,
    this.dataOrderbookEnd,
    this.dataTradeStart,
    this.dataTradeEnd,
    this.dataSymbolsCount,
    this.volume1HrsUsd,
    this.volume1DayUsd,
    this.volume1MthUsd,
    this.idIcon,
    this.dataStart,
    this.dataEnd,
    this.icon
  });

  @override
  List<Object?> get props => [
        assetId,
        name,
        typeIsCrypto,
        dataQuoteStart,
        dataQuoteEnd,
        dataOrderbookStart,
        dataOrderbookEnd,
        dataTradeStart,
        dataTradeEnd,
        dataSymbolsCount,
        volume1HrsUsd,
        volume1DayUsd,
        volume1MthUsd,
        idIcon,
        dataStart,
        dataEnd,
        icon
      ];
}

class AssetIcon extends Equatable {
  final String? assetId;
  final String? url;

  const AssetIcon({this.assetId, this.url});

  @override
  List<Object?> get props => [assetId, url];
}
