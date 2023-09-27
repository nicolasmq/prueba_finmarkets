
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/asset_ohlcv_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/period_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/symbols_remote_data_source.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/repository/asset_ohlcv_repository_impl.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/repository/period_repository_impl.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/repository/symbol_repository_impl.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/asset_ohlcv_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/period_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/symbol_repository.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_all_periods.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_asset_ohlcv.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_symbols.dart';
import 'package:prueba_finmarkets/features/asset_detail/presentation/provider/asset_detail_provider.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/asset_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/icons_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/repository/asset_repository_impl.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/repository/icons_repository_impl.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/icons_repository.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart';
import 'package:prueba_finmarkets/features/currencies_list/presentation/provider/assets_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  
  // provider
  locator.registerFactory(() => AssetsProvider(locator()));
  locator.registerFactory(() => AssetDetailProvider(locator(), locator(), locator()));

  // usercases
  locator.registerLazySingleton(() => GetAllAssetsWithIcons(locator(), locator()));
  locator.registerLazySingleton(() => GetAllPeriod(periodRepository: locator()));
  locator.registerLazySingleton(() => GetSymbols(symbolRepository: locator()));
  locator.registerLazySingleton(() => GetAssetOhlcv(assetOhlcvRepository: locator()));

  // repository
  locator.registerLazySingleton<AssetRepository>(() => AssetRepositoryImpl(assetRemoteDataSource: locator()));
  locator.registerLazySingleton<IconsRepository>(() => IconsRepositoryImpl(iconsRemoteDataSource: locator()));
  locator.registerLazySingleton<PeriodRepository>(() => PeriodRepositoryImpl(locator()));
  locator.registerLazySingleton<SymbolRepository>(() => SymbolRepositoryImpl(locator()));
  locator.registerLazySingleton<AssetOhlcvRepository>(() => AssetOhlcvRepositoryImpl(locator()));

  // data source
  locator.registerLazySingleton<AssetRemoteDataSource>(() => AssetRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<IconsRemoteDataSource>(() => IconsRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<PeriodRemoteDataSource>(() => PeriodsRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<SymbolsRemoteDataSource>(() => SymbolsRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<AssetOhlcvRemoteDataSource>(() => AssetOhlcvRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}