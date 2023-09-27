
import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

abstract class IconsRepository {

  Future<Either<Failure, List<AssetIcon>>> getAllIcons();
}