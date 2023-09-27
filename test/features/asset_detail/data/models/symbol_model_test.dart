
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/symbol_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart';

import '../../../../helpers/testing_data/json_reader.dart';

void main() {

  final testSymbolModel = SymbolModel(
    symbolId: "KRAKENFTS_PERP_BTC_USD",
    exchangeId: "KRAKENFTS",
    symbolType: "PERPETUAL",
    assetIdBase: "BTC",
    assetIdQuote: "USD",
    assetIdUnit: "USD",
    futureContractUnit: 1.000000000,
    futureContractUnitAsset: "USD",
    dataStart: DateTime.parse("2019-10-30"),
    dataEnd: DateTime.parse("2021-03-03"),
    dataQuoteStart: DateTime.parse("2019-10-30T16:53:10.3262317Z"),
    dataQuoteEnd: DateTime.parse("2021-03-03T13:51:45.6970000Z"),
    dataOrderbookStart: DateTime.parse("2019-10-30T16:53:10.3262317Z"),
    dataOrderbookEnd: DateTime.parse("2020-08-05T14:37:32.0080000Z"),
    dataTradeStart: DateTime.parse("2019-10-30T16:38:52.1620000Z"),
    dataTradeEnd: DateTime.parse("2021-03-03T13:46:25.7810000Z"),
    volume1Hrs: 22897091.000000000,
    volume1HrsUsd: 22897091.00,
    volume1Day: 459390289.000000000,
    volume1DayUsd: 459390289.00,
    volume1Mth: 12875674995.000000000,
    volume1MthUsd: 12875674995.00,
    price: 51266,
    symbolIdExchange: "pi_xbtusd",
    assetIdBaseExchange: "XBT",
    assetIdQuoteExchange: "USD",
    pricePrecision: 0.100000000,
    sizePrecision: 1.000000000,
  );

  final testSymbols = <SymbolModel>[
    SymbolModel(
      symbolId: "KRAKENFTS_PERP_BTC_USD",
      exchangeId: "KRAKENFTS",
      symbolType: "PERPETUAL",
      assetIdBase: "BTC",
      assetIdQuote: "USD",
      assetIdUnit: "USD",
      futureContractUnit: 1.000000000,
      futureContractUnitAsset: "USD",
      dataStart: DateTime.parse("2019-10-30"),
      dataEnd: DateTime.parse("2021-03-03"),
      dataQuoteStart: DateTime.parse("2019-10-30T16:53:10.3262317Z"),
      dataQuoteEnd: DateTime.parse("2021-03-03T13:51:45.6970000Z"),
      dataOrderbookStart: DateTime.parse("2019-10-30T16:53:10.3262317Z"),
      dataOrderbookEnd: DateTime.parse("2020-08-05T14:37:32.0080000Z"),
      dataTradeStart: DateTime.parse("2019-10-30T16:38:52.1620000Z"),
      dataTradeEnd: DateTime.parse("2021-03-03T13:46:25.7810000Z"),
      volume1Hrs: 22897091.000000000,
      volume1HrsUsd: 22897091.00,
      volume1Day: 459390289.000000000,
      volume1DayUsd: 459390289.00,
      volume1Mth: 12875674995.000000000,
      volume1MthUsd: 12875674995.00,
      price: 51266,
      symbolIdExchange: "pi_xbtusd",
      assetIdBaseExchange: "XBT",
      assetIdQuoteExchange: "USD",
      pricePrecision: 0.100000000,
      sizePrecision: 1.000000000,
    )
  ];

  test('should be a subclass of asset entity', () {

    //assert
    expect(testSymbolModel, isA<SymbolEntity>());
  });

  test('should return a list from json', () {

    // arrange
    final List<dynamic> jsonList = json.decode(
        readJson('helpers/testing_data/testing_symbols_response.json')
    );
    // act
    final result = jsonList.map((data) => SymbolModel.fromMap(data)).toList();
    // assert
    expect(result, equals(testSymbols));
  });



}