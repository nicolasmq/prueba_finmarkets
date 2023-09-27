import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/asset_ohlcv_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/period_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/symbols_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/asset_ohlcv_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/period_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/symbol_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_all_periods.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_asset_ohlcv.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_symbols.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/asset_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/icons_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/icons_repository.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart';

@GenerateMocks(
  [
    AssetRepository,
    IconsRepository,
    AssetOhlcvRepository,
    PeriodRepository,
    SymbolRepository,
    AssetRemoteDataSource,
    IconsRemoteDataSource,
    PeriodRemoteDataSource,
    SymbolsRemoteDataSource,
    AssetOhlcvRemoteDataSource,
    GetAllAssetsWithIcons,
    GetAssetOhlcv,
    GetSymbols,
    GetAllPeriod,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
