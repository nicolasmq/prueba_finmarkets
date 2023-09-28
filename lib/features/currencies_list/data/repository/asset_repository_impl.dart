

import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/asset_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';

class AssetRepositoryImpl extends AssetRepository {

  final AssetRemoteDataSource assetRemoteDataSource;

  AssetRepositoryImpl({required this.assetRemoteDataSource});

  @override
  Future<Either<Failure, List<AssetEntity>>> getFilterAssets(List<String> assetsIds) async {
    try {
      final result = await assetRemoteDataSource.getFilterAssets(assetsIds);
      return Right(result.map((r) => r.toEntity()).toList());
    } on ServerException {
      return const Left(BadRequest(ErrorsMessages.badRequest));
    }
  }

}