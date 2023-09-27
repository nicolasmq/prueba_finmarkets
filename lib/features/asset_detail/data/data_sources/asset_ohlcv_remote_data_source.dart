import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/asset_ohlcv_model.dart';

abstract class AssetOhlcvRemoteDataSource {
  Future<List<AssetOhlcvModel>> getAssetOhlcv(
      {required String symbolId,
      required String periodId,
      required DateTime timeStart,
      DateTime? timeEnd,
      bool? includeEmptyItems,
      int? limit});
}

class AssetOhlcvRemoteDataSourceImpl extends AssetOhlcvRemoteDataSource {
  final http.Client client;

  AssetOhlcvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AssetOhlcvModel>> getAssetOhlcv(
      {required String symbolId,
      required String periodId,
      required DateTime timeStart,
      DateTime? timeEnd,
      bool? includeEmptyItems,
      int? limit}) async {
    final response = await client.get(Uri.parse(Urls.ohlcvUrl(symbolId, periodId, timeStart)), headers: {
      "X-CoinAPI-Key": Urls.apiKey
    },);

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => AssetOhlcvModel.fromMap(data))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
