
import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/features/currency_detail/domain/entities/exchange_rate_entity.dart';

abstract class ExchangeRateRepository {

  Future<Either<String, List<ExchangeRateEntity>>> getExchangeRateList(List<String> assets);
}