
import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

abstract class AssetRepository {

  Future<Either<Failure, List<AssetEntity>>> getAllAssets();
  Future<Either<Failure, List<AssetIcon>>> getAllAssetIcons();
}