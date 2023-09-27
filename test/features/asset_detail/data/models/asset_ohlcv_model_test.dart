

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/asset_ohlcv_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';

import '../../../../helpers/testing_data/json_reader.dart';

void main() {

  final testAssetOhlcvModel = AssetOhlcvModel(
    timePeriodStart: DateTime.parse("2017-01-01T00:00:00.0000000Z"),
    timePeriodEnd: DateTime.parse("2017-01-02T00:00:00.0000000Z"),
    timeOpen: DateTime.parse("2017-01-01T00:01:08.0000000Z"),
    timeClose: DateTime.parse("2017-01-01T23:59:46.0000000Z"),
    priceOpen: 966.340000000,
    priceHigh: 1005.000000000,
    priceLow: 960.530000000,
    priceClose: 997.750000000,
    volumeTraded: 6850.593308590,
    tradesCount: 7815,
  );

  final testOhlcvs = <AssetOhlcvEntity>[
    AssetOhlcvModel(
      timePeriodStart: DateTime.parse("2017-01-01T00:00:00.0000000Z"),
      timePeriodEnd: DateTime.parse("2017-01-02T00:00:00.0000000Z"),
      timeOpen: DateTime.parse("2017-01-01T00:01:08.0000000Z"),
      timeClose: DateTime.parse("2017-01-01T23:59:46.0000000Z"),
      priceOpen: 966.340000000,
      priceHigh: 1005.000000000,
      priceLow: 960.530000000,
      priceClose: 997.750000000,
      volumeTraded: 6850.593308590,
      tradesCount: 7815,
    )
  ];

  test('should be a subclass of asset entity', () {

    //assert
    expect(testAssetOhlcvModel, isA<AssetOhlcvEntity>());
  });

  test('should return a list from json', () {

    // arrange
    final List<dynamic> jsonList = json.decode(
        readJson('helpers/testing_data/testing_asset_ohlcv_response.json')
    );
    // act
    final result = jsonList.map((data) => AssetOhlcvModel.fromMap(data)).toList();
    // assert
    expect(result, equals(testOhlcvs));
  });



}