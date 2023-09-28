import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/asset_ohlcv_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/period_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/symbols_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/asset_ohlcv_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/period_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/symbol_model.dart';

import '../../../../helpers/test_helper.mocks.dart';
import '../../../../helpers/testing_data/json_reader.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late PeriodsRemoteDataSourceImpl periodRemoteDataSourceImpl;
  late SymbolsRemoteDataSourceImpl symbolsRemoteDataSourceImpl;
  late AssetOhlcvRemoteDataSourceImpl assetOhlcvRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    periodRemoteDataSourceImpl =
        PeriodsRemoteDataSourceImpl(client: mockHttpClient);
    symbolsRemoteDataSourceImpl =
        SymbolsRemoteDataSourceImpl(client: mockHttpClient);
    assetOhlcvRemoteDataSourceImpl =
        AssetOhlcvRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get periods', () {
    test("Get all the period when request return status 200", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.periodsUrl), headers: {
        "X-CoinAPI-Key": Urls.apiKey
      })).thenAnswer((_) async => http.Response(
          readJson('helpers/testing_data/testing_periods_response.json'), 200));

      // act
      final result = await periodRemoteDataSourceImpl.getAllPeriods();
      // assert
      expect(result, isA<List<PeriodModel>>());
    });

    test("Get an exception when request return status 404", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.periodsUrl),
              headers: {"X-CoinAPI-Key": Urls.apiKey}))
          .thenAnswer(
              (_) async => http.Response(ErrorsMessages.badRequest, 404));
      // act
      final result = await periodRemoteDataSourceImpl.getAllPeriods();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  const testAssetId = "BTC";

  group('Get symbols', () {
    test("Get the asset symbols when request return status 200", () async {
      // arrange
      when(mockHttpClient.get(
              Uri.parse(Urls.symbolsUrlByAssetId(assetId: testAssetId)),
              headers: {"X-CoinAPI-Key": Urls.apiKey}))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/testing_data/testing_symbols_response.json'),
              200));

      // act
      final result = await symbolsRemoteDataSourceImpl.getSymbols(testAssetId);
      // assert
      expect(result, isA<List<SymbolModel>>());
    });

    test("Get server exception when request return status 404", () async {
      // arrange
      when(mockHttpClient
          .get(Uri.parse(Urls.symbolsUrlByAssetId(assetId: testAssetId)),
              headers: {"X-CoinAPI-Key": Urls.apiKey})).thenAnswer(
          (_) async => http.Response(ErrorsMessages.badRequest, 404));

      // act
      final result = symbolsRemoteDataSourceImpl.getSymbols(testAssetId);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  const testSymbolId = "BINANCE_SPOT_BTC_USD";
  const testPeriodId = "1MTH";
  final testStartTime = DateTime.parse("2021-01-01T23:59:46.0000000Z");

  group("get asset Ohlcv", () {
    test("should return asset ohlcv list when the response code is 200",
        () async {
      // arrange
      when(mockHttpClient.get(
          Uri.parse(Urls.ohlcvUrl(testSymbolId, testPeriodId, testStartTime.toIso8601String())),
          headers: {
            "X-CoinAPI-Key": Urls.apiKey
          })).thenAnswer((_) async => http.Response(
          readJson('helpers/testing_data/testing_asset_ohlcv_response.json'),
          200));
      // act
      final result = await assetOhlcvRemoteDataSourceImpl.getAssetOhlcv(
          symbolId: testSymbolId,
          periodId: testPeriodId,
          timeStart: testStartTime);
      // assert
      expect(result, isA<List<AssetOhlcvModel>>());
    });

    test("should return server exception when the response code is 404",
            () async {
          // arrange
          when(mockHttpClient.get(
              Uri.parse(Urls.ohlcvUrl(testSymbolId, testPeriodId, testStartTime.toIso8601String())),
              headers: {
                "X-CoinAPI-Key": Urls.apiKey
              })).thenAnswer((_) async => http.Response(
              ErrorsMessages.badRequest,
              404));
          // act
          final result = assetOhlcvRemoteDataSourceImpl.getAssetOhlcv(
              symbolId: testSymbolId,
              periodId: testPeriodId,
              timeStart: testStartTime);
          // assert
          expect(result, throwsA(isA<ServerException>()));
        });
  });
}
