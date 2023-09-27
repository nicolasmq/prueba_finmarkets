

import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/symbols_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/symbol_repository.dart';

class SymbolRepositoryImpl extends SymbolRepository {
  final SymbolsRemoteDataSource symbolsRemoteDataSource;

  SymbolRepositoryImpl(this.symbolsRemoteDataSource);

  @override
  Future<Either<Failure, List<SymbolEntity>>> getSymbols(String assetId) async {
    try {
      final result = await symbolsRemoteDataSource.getSymbols(assetId);

      return Right(result.map((r) => r.toSymbolEntity()).toList());
    } on ServerException {
      return const Left(BadRequest(ErrorsMessages.badRequest));
    }
  }


}