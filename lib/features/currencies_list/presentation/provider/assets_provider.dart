import 'package:flutter/material.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart';

class AssetsProvider extends ChangeNotifier {
  List<AssetEntity> _assetList = [];
  List<AssetEntity> get assetList => _assetList;

  String _errorMessage = '';
  String get showError => _errorMessage;

  bool loading = false;
  setError() {}
  final GetAllAssetsWithIcons _getAllAssetsWithIcons;

  AssetsProvider(this._getAllAssetsWithIcons);

  Future<void> getAllAssetsWithIcons() async {
    loading = true;
    final result = await _getAllAssetsWithIcons.call(Lists.assetsIds);

    result.fold((failure) {
      _errorMessage = failure.message;
      loading = false;
      notifyListeners();
    }, (assets) {
      _assetList = assets;
      loading = false;
      notifyListeners();
    });


  }
}
