import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_finmarkets/core/constants/constants.dart';
import 'package:prueba_finmarkets/core/error/server_exception.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/asset_remote_data_source.dart';
import 'package:prueba_finmarkets/features/currencies_list/data/models/asset_model.dart';

import '../../../helpers/test_helper.mocks.dart';
import '../../../helpers/testing_data/json_reader.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late AssetRemoteDataSourceImpl assetRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    assetRemoteDataSourceImpl =
        AssetRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get asset list', () {
    test("should return asset list when the response code is 200", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.allAssets))).thenAnswer(
          (_) async => http.Response(
              readJson('helpers/testing_data/testing_asset_response.json'),
              200));
      // act
      final result = await assetRemoteDataSourceImpl.getAllAssets();
      // assert
      expect(result, isA<List<AssetModel>>());
    });

    test("should throw a server exception when the response code is 404", () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.allAssets))).thenAnswer(
              (_) async => http.Response(
              'Not found',
              404));
      // act
      final result = assetRemoteDataSourceImpl.getAllAssets();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
