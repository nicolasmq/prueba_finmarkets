import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/asset_ohlcv_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/repository/asset_ohlcv_repository_impl.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAssetOhlcvRemoteDataSource mockAssetOhlcvRemoteDataSource;
  late AssetOhlcvRepositoryImpl assetOhlcvRepositoryImpl;

  setUp(() {
    mockAssetOhlcvRemoteDataSource = MockAssetOhlcvRemoteDataSource();
    assetOhlcvRepositoryImpl =
        AssetOhlcvRepositoryImpl(mockAssetOhlcvRemoteDataSource);
  });

  final testOhlcvsModel = <AssetOhlcvModel>[
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

  final testOhlcvsEntity = <AssetOhlcvEntity>[
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

  test("should return symbols when a call to data source is successful",
      () async {
    // arrange
    when(mockAssetOhlcvRemoteDataSource.getAssetOhlcv(
            symbolId: testSymbolId,
            periodId: testPeriodId,
            timeStart: testStartTime))
        .thenAnswer((_) async => testOhlcvsModel);
    // act
    final result = await assetOhlcvRepositoryImpl.getAssetOhlcv(
        testSymbolId, testPeriodId, testStartTime);
    // assert
    expect(result.fold((failure) => failure, (assets) => assets),
        equals(testOhlcvsEntity));
  });
}
