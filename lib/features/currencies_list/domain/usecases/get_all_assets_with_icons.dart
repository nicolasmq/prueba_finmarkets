import 'package:dartz/dartz.dart';
import 'package:prueba_finmarkets/core/error/failure.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/icons_repository.dart';

class GetAllAssetsWithIcons {
  final AssetRepository assetRepository;
  final IconsRepository iconsRepository;

  GetAllAssetsWithIcons(this.assetRepository, this.iconsRepository);

  Future<Either<Failure, List<AssetEntity>>> call(List<String> assetsIds) async {
    final assets = await assetRepository.getFilterAssets(assetsIds);
    final icons = await iconsRepository.getAllIcons();
    return assets.flatMap((a) => icons.map((i) => _combineData(a, i)));
  }

  List<AssetEntity> _combineData(
      List<AssetEntity> assets, List<AssetIcon> icons) {
    final combinedData = <AssetEntity>[];

    for (final asset in assets) {
      final matchingIcon =
          icons.singleWhere((icon) => icon.assetId == asset.assetId, orElse: () =>  const AssetIcon());

      final combinedAsset = AssetEntity(
          assetId: asset.assetId,
          name: asset.name,
          typeIsCrypto: asset.typeIsCrypto,
          dataQuoteStart: asset.dataQuoteStart,
          dataQuoteEnd: asset.dataQuoteEnd,
          dataOrderbookStart: asset.dataOrderbookStart,
          dataOrderbookEnd: asset.dataOrderbookEnd,
          dataTradeStart: asset.dataTradeStart,
          dataTradeEnd: asset.dataTradeEnd,
          dataSymbolsCount: asset.dataSymbolsCount,
          volume1HrsUsd: asset.volume1HrsUsd,
          volume1DayUsd: asset.volume1DayUsd,
          volume1MthUsd: asset.volume1MthUsd,
          idIcon: asset.idIcon,
          priceUsd: asset.priceUsd,
          dataStart: asset.dataStart,
          dataEnd: asset.dataEnd,
          icon: matchingIcon);

      combinedData.add(combinedAsset);
    }

    return combinedData;
  }
}
