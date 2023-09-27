import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/presentation/provider/assets_provider.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetAllAssetsWithIcons mockGetAllAssetsWithIcons;
  late AssetsProvider assetsProvider;

  setUp(() {
    mockGetAllAssetsWithIcons = MockGetAllAssetsWithIcons();
    assetsProvider = AssetsProvider(mockGetAllAssetsWithIcons);
  });

  final testListAssetEntity = <AssetEntity>[
    AssetEntity(
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
        icon: const AssetIcon(assetId: 'USD', url: '')),
  ];

  test("assets list is empty", () {
    expect(assetsProvider.assetList, []);
  });

  test("the assets are loaded", () async {
    // arrange
    when(mockGetAllAssetsWithIcons.call(Lists.assetsIds))
        .thenAnswer((_) async => Right(testListAssetEntity));
    // act
    await assetsProvider.getAllAssetsWithIcons();
    // assert
    expect(assetsProvider.assetList, equals(testListAssetEntity));
  });
}
