

import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/icons_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/icons_repository.dart';

class IconsRepositoryImpl extends IconsRepository {
  final IconsRemoteDataSource iconsRemoteDataSource;

  IconsRepositoryImpl({required this.iconsRemoteDataSource});

  @override
  Future<Either<Failure, List<AssetIcon>>> getAllIcons() async {
    try{
      final result = await iconsRemoteDataSource.getAllAssetIcons();
      return Right(result.map((r) => r.toAssetIcon()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has ocurred'));
    }
  }
}