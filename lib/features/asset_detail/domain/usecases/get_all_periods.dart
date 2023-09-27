

import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/period_repository.dart';

class GetAllPeriod {

  final PeriodRepository periodRepository;

  GetAllPeriod({required this.periodRepository});

  Future<Either<Failure, List<PeriodEntity>>> call() async {

    return periodRepository.getPeriods();
  }
}