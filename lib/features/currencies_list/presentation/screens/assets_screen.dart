import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/presentation/provider/assets_provider.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  void initState() {
    super.initState();
    final assetsProvider = Provider.of<AssetsProvider>(context, listen: false);
    assetsProvider.getAllAssetsWithIcons();
  }

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: !assetsProvider.loading,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
            child: Visibility(
              visible: assetsProvider.showError.isEmpty,
              child: Column(
                children: [
                  const Center(
                    child: Text('Assets'),
                  ),
                  ...assetsProvider.assetList
                      .map((assetEntity) =>
                          AssetListTile(assetEntity: assetEntity))
                      .toList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AssetListTile extends StatelessWidget {
  const AssetListTile({
    super.key,
    required this.assetEntity,
  });
  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(assetEntity.name!),
      subtitle: Text(assetEntity.assetId!),
      leading: CachedNetworkImage(
        imageUrl: assetEntity.icon?.url ?? '',
        height: 50.0,
        width: 50.0,
      ),
      trailing: Text(assetEntity.priceUsd
              ?.toStringAsFixed(decimals(assetEntity.priceUsd)) ??
          ""),
      onTap: () {
        context.goNamed('asset-detail',
            pathParameters: {"id": assetEntity.assetId!}, extra: assetEntity);
      },
    );
  }

  int decimals(double? priceUsd) {
    if (priceUsd != null) {
      if (priceUsd > 1) {
        return 2;
      } else if (priceUsd < 1 && priceUsd <= 0.0001) {
        return 5;
      } else if (priceUsd < 1 && priceUsd > 0.00001) {
        return 3;
      }
    }
    return 0;
  }
}
