
import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';

abstract class AssetOhlcvRepository {

  Future<Either<Failure, AssetOhlcvEntity>> getAssetHistory();
}