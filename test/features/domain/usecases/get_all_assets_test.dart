import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllAssets getAllAssets;
  late MockAssetRepository mockAssetRepository;

  setUp(() {
    mockAssetRepository = MockAssetRepository();
    getAllAssets = GetAllAssets(mockAssetRepository);
  });

  final List<AssetEntity> assets = [
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

  test('should get all the assets from the repository', () async {
    
    // arrange
    when(mockAssetRepository.getAllAssets()).thenAnswer((realInvocation) async => Right(assets));
    // act
    final result = await getAllAssets();
    // assert
    expect(result, Right(assets));
  });
}
