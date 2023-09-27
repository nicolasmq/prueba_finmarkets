import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/asset_ohlcv_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/asset_ohlcv_repository.dart';

class AssetOhlcvRepositoryImpl extends AssetOhlcvRepository {
  final AssetOhlcvRemoteDataSource assetOhlcvRemoteDataSource;

  AssetOhlcvRepositoryImpl(this.assetOhlcvRemoteDataSource);

  @override
  Future<Either<Failure, List<AssetOhlcvEntity>>> getAssetOhlcv(
      String symbolId, String periodId, DateTime timeStart,
      {DateTime? timeEnd, bool? includeEmptyItems, int? limit}) async {
    try {
      final result = await assetOhlcvRemoteDataSource.getAssetOhlcv(
          symbolId: symbolId, periodId: periodId, timeStart: timeStart);

      return Right(result.map((r) => r.toAssetOhlcvEntity()).toList());
    } on ServerException {
      return const Left(BadRequest(ErrorsMessages.badRequest));
    }
  }
}
