
import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart';

abstract class SymbolRepository {

  Future<Either<Failure, List<SymbolEntity>>> getSymbols(String assetId);
}