import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_asset_ohlcv.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAssetOhlcvRepository mockAssetOhlcvRepository;
  late GetAssetOhlcv getAssetOhlcv;

  setUp(() {
    mockAssetOhlcvRepository = MockAssetOhlcvRepository();
    getAssetOhlcv =
        GetAssetOhlcv(assetOhlcvRepository: mockAssetOhlcvRepository);
  });

  final testOhlcv = <AssetOhlcvEntity>[
    AssetOhlcvEntity(
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

  const testSymbolId = "BINANCE_SPOT_BTC_USD";
  const testPeriodId = "1MTH";
  final testStartTime = DateTime.parse("2021-01-01T23:59:46.0000000Z");

  test("should return Ohlcv", () async {
    //arrange
    when(mockAssetOhlcvRepository.getAssetOhlcv(
        testSymbolId, testPeriodId, testStartTime))
        .thenAnswer((_) async => Right(testOhlcv));
    //act
    final result = await getAssetOhlcv.call(
      testSymbolId,
      testPeriodId,
      testStartTime,
    );

    //assert
    expect(result, equals(Right(testOhlcv)));
  });
}
