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

  void call({required String assetId}) {
    getSymbols(assetId);
  }

  void getPeriods() async {
    _errorMessage = '';
    await Future.delayed(Duration(milliseconds: 2000));
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

  DateTime getTimeStart(PeriodEntity period) {
    switch (period.unitName) {
      case "second":
        return DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second - period.unitCount!);
      case "minute":
        return DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateTime.now().hour,
            DateTime.now().minute - period.unitCount!,
            DateTime.now().second);
      case "hour":
        return DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateTime.now().hour - period.unitCount!,
            DateTime.now().minute,
            DateTime.now().second);
      case "day":
        return DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - period.unitCount!,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second);
      case "month":
        return DateTime(
            DateTime.now().year,
            DateTime.now().month - period.unitCount!,
            DateTime.now().day,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second);
      case "year":
        return DateTime(
            DateTime.now().year - period.unitCount!,
            DateTime.now().month,
            DateTime.now().hour,
            DateTime.now().day,
            DateTime.now().minute,
            DateTime.now().second);
      default:
        return DateTime(DateTime.now().year);
    }
  }
}
