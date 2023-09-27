
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/period_model.dart';

abstract class PeriodRemoteDataSource {

  Future<List<PeriodModel>> getAllPeriods();
}

class PeriodsRemoteDataSourceImpl extends PeriodRemoteDataSource {
  final http.Client client;

  PeriodsRemoteDataSourceImpl({required this.client});
  
  @override
  Future<List<PeriodModel>> getAllPeriods() async {
    final response = await http.get(Uri.parse(Urls.periodsUrl), headers: {
      "X-CoinAPI-Key": Urls.apiKey
    },);

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => PeriodModel.fromMap(data))
          .toList();
    } else {

      throw ServerException();
    }
  }
  
}
