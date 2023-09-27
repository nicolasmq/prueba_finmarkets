
import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';

abstract class PeriodRepository {

  Future<Either<Failure, List<PeriodEntity>>> getPeriods();
}