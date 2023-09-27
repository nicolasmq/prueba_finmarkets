
import 'package:equatable/equatable.dart';

class PeriodEntity extends Equatable{
  final String? periodId;
  final int? lengthSeconds;
  final int? lengthMonths;
  final int? unitCount;
  final String? unitName;
  final String? displayName;

  const PeriodEntity({
    this.periodId,
    this.lengthSeconds,
    this.lengthMonths,
    this.unitCount,
    this.unitName,
    this.displayName,
  });

  @override
  List<Object?> get props => [
    periodId,
    lengthSeconds,
    lengthMonths,
    unitCount,
    unitName,
    displayName,
  ];
}