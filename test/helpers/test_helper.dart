import 'package:mockito/annotations.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [AssetRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
