import 'package:flutter/material.dart';
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart';

class AssetsProvider extends ChangeNotifier {
  AssetsProvider(this._getAllAssetsWithIcons);

  final GetAllAssetsWithIcons _getAllAssetsWithIcons;

  List<AssetEntity> _assetList = [];
  List<AssetEntity> get assetList => _assetList;

  String _errorMessage = '';
  String get showError => _errorMessage;

  bool loading = false;

  Future<void> getAllAssetsWithIcons() async {
    _errorMessage = "";
    loading = true;
    await Future.delayed(Duration(milliseconds: 2000));
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

    notifyListeners();


  }
}
