import 'dart:convert';

import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/models/asset_model.dart';

abstract class AssetRemoteDataSource {
  Future<List<AssetModel>> getFilterAssets(List<String> assetsIds);
}

class AssetRemoteDataSourceImpl extends AssetRemoteDataSource {
  final http.Client client;

  AssetRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AssetModel>> getFilterAssets(List<String> assetsIds) async {
    final response = await client.get(Uri.parse(Urls.filterAssetId(assetsIds)), headers: {
      "X-CoinAPI-Key": Urls.apiKey
    },);

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => AssetModel.fromMap(data))
          .toList();
    } else {
      throw ServerException();
    }
  }


}
