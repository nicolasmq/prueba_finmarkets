import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/asset_ohlcv_repository.dart';

class GetAssetOhlcv {
  final AssetOhlcvRepository assetOhlcvRepository;

  GetAssetOhlcv({required this.assetOhlcvRepository});

  Future<Either<Failure, List<AssetOhlcvEntity>>> call(
      String symbolId, String periodId, DateTime timeStart,
      {DateTime? timeEnd, bool? includeEmptyItems, int? limit}) async {
    return assetOhlcvRepository.getAssetOhlcv(symbolId, periodId, timeStart,
        timeEnd: timeEnd, includeEmptyItems: includeEmptyItems, limit: limit);
  }
}
