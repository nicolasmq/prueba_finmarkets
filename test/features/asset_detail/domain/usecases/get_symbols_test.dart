
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_symbols.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockSymbolRepository mockSymbolRepository;
  late GetSymbols getSymbols;

  setUp(() {
    mockSymbolRepository = MockSymbolRepository();
    getSymbols = GetSymbols(symbolRepository: mockSymbolRepository);
  });

  final testSymbols = <SymbolEntity>[
    SymbolEntity(
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

  test("should return symbols", () async {

    //arrange
    when(mockSymbolRepository.getSymbols('BTC'))
        .thenAnswer((_) async => Right(testSymbols));
    //act
    final result = await getSymbols.call('BTC');

    //assert
    expect(result, equals(Right(testSymbols)));
  });
}