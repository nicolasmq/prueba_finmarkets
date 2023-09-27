
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/models/asset_model.dart';

abstract class IconsRemoteDataSource {
  Future<List<AssetIconModel>> getAllAssetIcons();
}

class IconsRemoteDataSourceImpl extends IconsRemoteDataSource {

  final http.Client client;

  IconsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AssetIconModel>> getAllAssetIcons() async{
    final response = await client.get(Uri.parse(Urls.assetsIconUrl), headers: {
      "X-CoinAPI-Key": Urls.apiKey
    });

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => AssetIconModel.fromMap(data))
          .toList();
    } else {
      throw ServerException();
    }
  }
}