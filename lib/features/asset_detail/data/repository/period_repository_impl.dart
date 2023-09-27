

import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/period_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/period_repository.dart';

class PeriodRepositoryImpl extends PeriodRepository {
  final PeriodRemoteDataSource periodRemoteDataSource;

  PeriodRepositoryImpl(this.periodRemoteDataSource);

  @override
  Future<Either<Failure, List<PeriodEntity>>> getPeriods() async {

    try {
      final result = await periodRemoteDataSource.getAllPeriods();

      return Right(result.map((r) => r.toPeriodEntity()).toList());
    } on ServerException {
      return const Left(BadRequest(ErrorsMessages.badRequest));
    }
  }


}