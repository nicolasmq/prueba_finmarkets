
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
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
  
  // usercases
  locator.registerLazySingleton(() => GetAllAssetsWithIcons(locator(), locator()));
  
  // repository
  locator.registerLazySingleton<AssetRepository>(() => AssetRepositoryImpl(assetRemoteDataSource: locator()));
  locator.registerLazySingleton<IconsRepository>(() => IconsRepositoryImpl(iconsRemoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<AssetRemoteDataSource>(() => AssetRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<IconsRemoteDataSource>(() => IconsRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}