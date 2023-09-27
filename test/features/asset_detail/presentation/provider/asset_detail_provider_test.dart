


import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/asset_detail/presentation/provider/asset_detail_provider.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  late MockGetAllPeriod mockGetAllPeriod;
  late MockGetSymbols mockGetSymbols;
  late MockGetAssetOhlcv mockGetAssetOhlcv;
  late AssetDetailProvider assetDetilProvider;

  setUp(() {
    mockGetAllPeriod = MockGetAllPeriod();
    mockGetSymbols = MockGetSymbols();
    mockGetAssetOhlcv = MockGetAssetOhlcv();
  });

  test('empty periods', () {

  });
  test('empty symbols', () {

  });

  test('empty asset ohlcv', () {

  });
}