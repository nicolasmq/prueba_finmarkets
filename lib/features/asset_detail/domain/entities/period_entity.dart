
import 'package:equatable/equatable.dart';

class PeriodEntity extends Equatable{
  final DateTime? timePeriodStart;
  final DateTime? timePeriodEnd;
  final DateTime? timeOpen;
  final DateTime? timeClose;
  final double? priceOpen;
  final double? priceHigh;
  final double? priceLow;
  final double? priceClose;
  final double? volumeTraded;
  final int? tradesCount;

  const PeriodEntity({
    this.timePeriodStart,
    this.timePeriodEnd,
    this.timeOpen,
    this.timeClose,
    this.priceOpen,
    this.priceHigh,
    this.priceLow,
    this.priceClose,
    this.volumeTraded,
    this.tradesCount,
  });

  @override
  List<Object?> get props => [
    timePeriodStart,
    timePeriodEnd,
    timeOpen,
    timeClose,
    priceOpen,
    priceHigh,
    priceLow,
    priceClose,
    volumeTraded,
    tradesCount,
  ];
}