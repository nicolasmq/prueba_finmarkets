import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllAssetsWithIcons getAllAssetsWithIcons;
  late MockAssetRepository mockAssetRepository;
  late MockIconsRepository mockIconsRepository;

  setUp(() {
    mockAssetRepository = MockAssetRepository();
    mockIconsRepository = MockIconsRepository();
    getAllAssetsWithIcons =
        GetAllAssetsWithIcons(mockAssetRepository, mockIconsRepository);
  });

  final List<AssetEntity> testAssets = [
    AssetEntity(
      assetId: 'BTC',
      name: 'Bitcoin',
      dataEnd: DateTime.now(),
      dataOrderbookEnd: DateTime.now(),
      dataOrderbookStart: DateTime.now(),
      dataQuoteEnd: DateTime.now(),
      dataQuoteStart: DateTime.now(),
      dataStart: DateTime.now(),
      dataSymbolsCount: 0,
      dataTradeEnd: DateTime.now(),
      dataTradeStart: DateTime.now(),
      idIcon: "BTC",
      typeIsCrypto: 1,
      volume1DayUsd: 0.0,
      volume1HrsUsd: 0.0,
      volume1MthUsd: 1,
    )
  ];

  const List<AssetIcon> testIcons = [AssetIcon(assetId: 'BTC', url: 'url')];

  final List<AssetEntity> testCombinedAssets = [
    AssetEntity(
        assetId: 'BTC',
        name: 'Bitcoin',
        dataEnd: DateTime.now(),
        dataOrderbookEnd: DateTime.now(),
        dataOrderbookStart: DateTime.now(),
        dataQuoteEnd: DateTime.now(),
        dataQuoteStart: DateTime.now(),
        dataStart: DateTime.now(),
        dataSymbolsCount: 0,
        dataTradeEnd: DateTime.now(),
        dataTradeStart: DateTime.now(),
        idIcon: "BTC",
        typeIsCrypto: 1,
        volume1DayUsd: 0.0,
        volume1HrsUsd: 0.0,
        volume1MthUsd: 1,
        icon: const AssetIcon(assetId: 'BTC', url: 'url'))
  ];

  const assetsIds = ['BTC', 'USD'];

  test('should get all the assets combined with icons from its repositories', () async {
    // arrange
    when(mockAssetRepository.getFilterAssets(assetsIds))
        .thenAnswer((_) async => Right(testAssets));
    when(mockIconsRepository.getAllIcons())
        .thenAnswer((_) async => const Right(testIcons));
    // act
    final result = await getAllAssetsWithIcons.call(assetsIds);
    // assert
    expect(result.fold((failure) => failure, (assets) => assets),
        testCombinedAssets);
  });
}
