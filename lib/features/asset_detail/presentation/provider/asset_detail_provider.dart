import 'package:flutter/foundation.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_all_periods.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_asset_ohlcv.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_symbols.dart';

class AssetDetailProvider extends ChangeNotifier {
  final GetAllPeriod _getAllPeriod;
  final GetSymbols _getSymbols;
  final GetAssetOhlcv _getAssetOhlcv;

  AssetDetailProvider(
      this._getAllPeriod, this._getSymbols, this._getAssetOhlcv);

  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<PeriodEntity> _periodsList = [];
  List<PeriodEntity> get periodsList => _periodsList;

  List<SymbolEntity> _symbolList = [];
  List<SymbolEntity> get symbolList => _symbolList;

  List<AssetOhlcvEntity> _assetOhlcvList = [];
  List<AssetOhlcvEntity> get assetOhlcvList => _assetOhlcvList;

  void call(
      {required String assetId}) {
    getSymbols(assetId);
    getPeriods();
    notifyListeners();
  }

  void getPeriods() async {
    final result = await _getAllPeriod.call();
    result.fold((failure) {
      _errorMessage = failure.message;
      notifyListeners();
    }, (periods) {
      _periodsList = periods;
      notifyListeners();
    });
  }

  void getSymbols(String assetId) async {
    final result = await _getSymbols.call(assetId);
    result.fold((failure) {
      _errorMessage = failure.message;
      notifyListeners();
    }, (symbols) {
      _symbolList = symbols;
      notifyListeners();
    });
  }

  void getAssetOhlcv(
      String symbolId, String periodId, DateTime timeStart) async {
    final result = await _getAssetOhlcv.call(symbolId, periodId, timeStart);
    result.fold((failure) {
      _errorMessage = failure.message;
      notifyListeners();
    }, (assetOhlcv) {
      _assetOhlcvList = assetOhlcv;
      notifyListeners();
    });
  }
}
