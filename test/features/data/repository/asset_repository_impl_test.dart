import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/models/asset_model.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/repository/asset_repository_impl.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/repository/icons_repository_impl.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAssetRemoteDataSource mockAssetRemoteDataSource;
  late MockIconsRemoteDataSource mockIconsRemoteDataSource;
  late AssetRepositoryImpl assetRepositoryImpl;
  late IconsRepositoryImpl iconsRepositoryImpl;

  setUp(() {
    mockAssetRemoteDataSource = MockAssetRemoteDataSource();
    mockIconsRemoteDataSource = MockIconsRemoteDataSource();
    assetRepositoryImpl =
        AssetRepositoryImpl(assetRemoteDataSource: mockAssetRemoteDataSource);
    iconsRepositoryImpl =
        IconsRepositoryImpl(iconsRemoteDataSource: mockIconsRemoteDataSource);
  });

  final testListAssetModel = <AssetModel>[
    AssetModel(
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
        dataEnd: DateTime.parse("2023-09-24"),),
  ];

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
        dataEnd: DateTime.parse("2023-09-24"),),
  ];

  const assetsIds = ['BTC', 'USD'];

  group("get all asset", () {
    test("should return all assets when a call to data source is successful",
        () async {
      // arrange
      when(mockAssetRemoteDataSource.getFilterAssets(assetsIds))
          .thenAnswer((_) async => testListAssetModel);
      // act
      final result = await assetRepositoryImpl.getFilterAssets(assetsIds);
      // assert
      expect(result.fold((failure) => failure, (assets) => assets),
          equals(testListAssetEntity));
    });

    test(
      "should return a server failure when a call to remote data source is unsuccessful",
      () async {
        // arrange
        when(mockAssetRemoteDataSource.getFilterAssets(assetsIds))
            .thenThrow(ServerException());
        // act
        final result = await assetRepositoryImpl.getFilterAssets(assetsIds);
        // assert
        expect(
            result, equals(const Left(ServerFailure("An error has ocurred on assets call"))));
      },
    );
  });

  const testListAssetIconsModel = <AssetIconModel>[
    AssetIconModel(assetId: 'USD', url: 'url')
  ];

  const testListAssetIconsEntity = <AssetIcon>[
    AssetIcon(assetId: 'USD', url: 'url')
  ];

  group("get all asset icon", () {
    test(
        "should return all asset icons when a call to data source is successful",
        () async {
      // arrange
      when(mockIconsRemoteDataSource.getAllAssetIcons())
          .thenAnswer((_) async => testListAssetIconsModel);
      // act
      final result = await iconsRepositoryImpl.getAllIcons();
      // assert
      expect(result.fold((failure) => failure, (assets) => assets), equals(testListAssetIconsEntity));
    });

    test(
      "should return a server failure when a call to remote data source is unsuccessful",
      () async {
        // arrange
        when(mockIconsRemoteDataSource.getAllAssetIcons())
            .thenThrow(ServerException());
        // act
        final result = await iconsRepositoryImpl.getAllIcons();
        // assert
        expect(result, equals(const Left(ServerFailure("An error has ocurred"))));
      },
    );
  });
}
