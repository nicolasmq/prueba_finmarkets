


import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/models/asset_model.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

import '../../../../helpers/testing_data/json_reader.dart';

void main() {

  final testAssetModel = AssetModel(
    assetId: 'BTC',
    name: 'Bitcoin',
    dataEnd: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataOrderbookEnd: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataOrderbookStart: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataQuoteEnd: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataQuoteStart: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataStart: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataSymbolsCount: 0,
    dataTradeEnd: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    dataTradeStart: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
    idIcon: "BTC",
    typeIsCrypto: 1,
    volume1DayUsd: 0.0,
    volume1HrsUsd: 0.0,
    volume1MthUsd: 1,
  );

  final testListAssetModel = <dynamic> [
    AssetModel(
      assetId: 'USD',
      name: 'US Dollar',
      typeIsCrypto: 0,
      dataQuoteStart: DateTime.parse("2014-02-24T00:00:00.0000000Z"),
      dataQuoteEnd: DateTime.parse("2023-09-24T00:00:00.0000000Z"),
      dataOrderbookStart: DateTime.parse("2014-02-24T17:43:05.0000000Z"),
      dataOrderbookEnd: DateTime.parse("2023-07-07T00:00:00.0000000Z"),
      dataTradeStart: DateTime.parse("2010-07-17T00:00:00.0000000Z"),
      dataTradeEnd: DateTime.parse("2023-09-24T00:00:00.0000000Z"),
      dataSymbolsCount: 204054,
      volume1HrsUsd: 1973017115855.53,
      volume1DayUsd: 50553978025956.67,
      volume1MthUsd: 0,
      idIcon: "0a4185f2-1a03-4a7c-b866-ba7076d8c73b",
      dataStart: DateTime.parse("2010-07-17"),
      dataEnd: DateTime.parse("2023-09-24"),
    ),
  ];
  
  test('should be a subclass of asset entity', () {

    //assert
    expect(testAssetModel, isA<AssetEntity>());
  });

  test('should return a list from json', () {

    // arrange
    final List<dynamic> jsonList = json.decode(
      readJson('helpers/testing_data/testing_asset_response.json')
    );
    // act
    final result = jsonList.map((data) => AssetModel.fromMap(data)).toList();
    // assert
    expect(result, equals(testListAssetModel));
  });



}