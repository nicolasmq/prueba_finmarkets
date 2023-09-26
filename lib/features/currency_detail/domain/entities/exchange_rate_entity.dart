

import 'package:equatable/equatable.dart';

class ExchangeRateEntity extends Equatable {

  final DateTime? time;
  final String? assetIdBase;
  final String? assetIdQuote;
  final double? rate;

  const ExchangeRateEntity({
    this.time,
    this.assetIdBase,
    this.assetIdQuote,
    this.rate,
  });

  @override
  List<Object?> get props => [time, assetIdBase, assetIdQuote, rate];
}