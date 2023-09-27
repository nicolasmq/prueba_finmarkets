import 'package:mockito/annotations.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/asset_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/icons_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/icons_repository.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart';
import 'package:prueba_finmarkets/features/currencies_list/presentation/provider/assets_provider.dart';

@GenerateMocks(
  [
    AssetRepository,
    IconsRepository,
    AssetRemoteDataSource,
    IconsRemoteDataSource,
    GetAllAssetsWithIcons,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
