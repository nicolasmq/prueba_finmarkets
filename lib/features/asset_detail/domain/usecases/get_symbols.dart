

import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/period_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/symbol_repository.dart';

class GetSymbols {

  final SymbolRepository symbolRepository;

  GetSymbols({required this.symbolRepository});

  Future<Either<Failure, List<SymbolEntity>>> call(String assetId) async {

    return symbolRepository.getSymbols(assetId);
  }
}