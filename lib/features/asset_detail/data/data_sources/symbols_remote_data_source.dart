
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/symbol_model.dart';

abstract class SymbolsRemoteDataSource {

  Future<List<SymbolModel>> getSymbols(String assetId);
}

class SymbolsRemoteDataSourceImpl extends SymbolsRemoteDataSource {
  final http.Client client;

  SymbolsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SymbolModel>> getSymbols(String assetId) async {

    final response = await client.get(Uri.parse(Urls.symbolsUrlByAssetId(assetId: assetId)), headers: {
      "X-CoinAPI-Key": Urls.apiKey
    },);
    print( response.body );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => SymbolModel.fromMap(data))
          .toList();
    } else {
      throw ServerException();
    }

  }

}