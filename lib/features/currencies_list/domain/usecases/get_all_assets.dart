import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';

class GetAllAssets {
  final AssetRepository repository;

  GetAllAssets(this.repository);

  Future<Either<void, List<AssetEntity>>> call() async {
    return await repository.getAllAssets();
  }
}
