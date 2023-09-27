// Mocks generated by Mockito 5.4.2 from annotations
// in prueba_finmarkets/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:convert' as _i28;
import 'dart:typed_data' as _i29;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:prueba_finmarkets/core/error/failure.dart' as _i10;
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/asset_ohlcv_remote_data_source.dart'
    as _i22;
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/period_remote_data_source.dart'
    as _i18;
import 'package:prueba_finmarkets/features/asset_detail/data/data_sources/symbols_remote_data_source.dart'
    as _i20;
import 'package:prueba_finmarkets/features/asset_detail/data/models/asset_ohlcv_model.dart'
    as _i23;
import 'package:prueba_finmarkets/features/asset_detail/data/models/period_model.dart'
    as _i19;
import 'package:prueba_finmarkets/features/asset_detail/data/models/symbol_model.dart'
    as _i21;
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/asset_history.dart'
    as _i12;
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart'
    as _i13;
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/symbol_entity.dart'
    as _i14;
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/asset_ohlcv_repository.dart'
    as _i5;
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/period_repository.dart'
    as _i7;
import 'package:prueba_finmarkets/features/asset_detail/domain/repository/symbol_repository.dart'
    as _i6;
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_all_periods.dart'
    as _i27;
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_asset_ohlcv.dart'
    as _i25;
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_symbols.dart'
    as _i26;
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/asset_remote_data_source.dart'
    as _i15;
import 'package:prueba_finmarkets/features/currencies_list/data/data_sources/remote_data_source/icons_remote_data_source.dart'
    as _i17;
import 'package:prueba_finmarkets/features/currencies_list/data/models/asset_model.dart'
    as _i16;
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart'
    as _i11;
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/asset_repository.dart'
    as _i3;
import 'package:prueba_finmarkets/features/currencies_list/domain/repository/icons_repository.dart'
    as _i4;
import 'package:prueba_finmarkets/features/currencies_list/domain/usecases/get_all_assets_with_icons.dart'
    as _i24;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAssetRepository_1 extends _i1.SmartFake
    implements _i3.AssetRepository {
  _FakeAssetRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIconsRepository_2 extends _i1.SmartFake
    implements _i4.IconsRepository {
  _FakeIconsRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAssetOhlcvRepository_3 extends _i1.SmartFake
    implements _i5.AssetOhlcvRepository {
  _FakeAssetOhlcvRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSymbolRepository_4 extends _i1.SmartFake
    implements _i6.SymbolRepository {
  _FakeSymbolRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePeriodRepository_5 extends _i1.SmartFake
    implements _i7.PeriodRepository {
  _FakePeriodRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_6 extends _i1.SmartFake implements _i8.Response {
  _FakeResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_7 extends _i1.SmartFake
    implements _i8.StreamedResponse {
  _FakeStreamedResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AssetRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetRepository extends _i1.Mock implements _i3.AssetRepository {
  MockAssetRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetEntity>>> getFilterAssets(
          List<String>? assetsIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFilterAssets,
          [assetsIds],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetEntity>>>.value(
                _FakeEither_0<_i10.Failure, List<_i11.AssetEntity>>(
          this,
          Invocation.method(
            #getFilterAssets,
            [assetsIds],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetEntity>>>);
}

/// A class which mocks [IconsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIconsRepository extends _i1.Mock implements _i4.IconsRepository {
  MockIconsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetIcon>>> getAllIcons() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllIcons,
          [],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetIcon>>>.value(
                _FakeEither_0<_i10.Failure, List<_i11.AssetIcon>>(
          this,
          Invocation.method(
            #getAllIcons,
            [],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetIcon>>>);
}

/// A class which mocks [AssetOhlcvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetOhlcvRepository extends _i1.Mock
    implements _i5.AssetOhlcvRepository {
  MockAssetOhlcvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<
      _i2.Either<_i10.Failure, List<_i12.AssetOhlcvEntity>>> getAssetOhlcv(
    String? symbolId,
    String? periodId,
    DateTime? timeStart, {
    DateTime? timeEnd,
    bool? includeEmptyItems,
    int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAssetOhlcv,
          [
            symbolId,
            periodId,
            timeStart,
          ],
          {
            #timeEnd: timeEnd,
            #includeEmptyItems: includeEmptyItems,
            #limit: limit,
          },
        ),
        returnValue: _i9.Future<
                _i2.Either<_i10.Failure, List<_i12.AssetOhlcvEntity>>>.value(
            _FakeEither_0<_i10.Failure, List<_i12.AssetOhlcvEntity>>(
          this,
          Invocation.method(
            #getAssetOhlcv,
            [
              symbolId,
              periodId,
              timeStart,
            ],
            {
              #timeEnd: timeEnd,
              #includeEmptyItems: includeEmptyItems,
              #limit: limit,
            },
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i12.AssetOhlcvEntity>>>);
}

/// A class which mocks [PeriodRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPeriodRepository extends _i1.Mock implements _i7.PeriodRepository {
  MockPeriodRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i13.PeriodEntity>>> getPeriods() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPeriods,
          [],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i13.PeriodEntity>>>.value(
                _FakeEither_0<_i10.Failure, List<_i13.PeriodEntity>>(
          this,
          Invocation.method(
            #getPeriods,
            [],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i13.PeriodEntity>>>);
}

/// A class which mocks [SymbolRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSymbolRepository extends _i1.Mock implements _i6.SymbolRepository {
  MockSymbolRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i14.SymbolEntity>>> getSymbols(
          String? assetId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSymbols,
          [assetId],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i14.SymbolEntity>>>.value(
                _FakeEither_0<_i10.Failure, List<_i14.SymbolEntity>>(
          this,
          Invocation.method(
            #getSymbols,
            [assetId],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i14.SymbolEntity>>>);
}

/// A class which mocks [AssetRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetRemoteDataSource extends _i1.Mock
    implements _i15.AssetRemoteDataSource {
  MockAssetRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i16.AssetModel>> getFilterAssets(List<String>? assetsIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFilterAssets,
          [assetsIds],
        ),
        returnValue:
            _i9.Future<List<_i16.AssetModel>>.value(<_i16.AssetModel>[]),
      ) as _i9.Future<List<_i16.AssetModel>>);
}

/// A class which mocks [IconsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIconsRemoteDataSource extends _i1.Mock
    implements _i17.IconsRemoteDataSource {
  MockIconsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i16.AssetIconModel>> getAllAssetIcons() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllAssetIcons,
          [],
        ),
        returnValue: _i9.Future<List<_i16.AssetIconModel>>.value(
            <_i16.AssetIconModel>[]),
      ) as _i9.Future<List<_i16.AssetIconModel>>);
}

/// A class which mocks [PeriodRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPeriodRemoteDataSource extends _i1.Mock
    implements _i18.PeriodRemoteDataSource {
  MockPeriodRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i19.PeriodModel>> getAllPeriods() => (super.noSuchMethod(
        Invocation.method(
          #getAllPeriods,
          [],
        ),
        returnValue:
            _i9.Future<List<_i19.PeriodModel>>.value(<_i19.PeriodModel>[]),
      ) as _i9.Future<List<_i19.PeriodModel>>);
}

/// A class which mocks [SymbolsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSymbolsRemoteDataSource extends _i1.Mock
    implements _i20.SymbolsRemoteDataSource {
  MockSymbolsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i21.SymbolModel>> getSymbols(String? assetId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSymbols,
          [assetId],
        ),
        returnValue:
            _i9.Future<List<_i21.SymbolModel>>.value(<_i21.SymbolModel>[]),
      ) as _i9.Future<List<_i21.SymbolModel>>);
}

/// A class which mocks [AssetOhlcvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetOhlcvRemoteDataSource extends _i1.Mock
    implements _i22.AssetOhlcvRemoteDataSource {
  MockAssetOhlcvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i23.AssetOhlcvModel>> getAssetOhlcv({
    required String? symbolId,
    required String? periodId,
    required DateTime? timeStart,
    DateTime? timeEnd,
    bool? includeEmptyItems,
    int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAssetOhlcv,
          [],
          {
            #symbolId: symbolId,
            #periodId: periodId,
            #timeStart: timeStart,
            #timeEnd: timeEnd,
            #includeEmptyItems: includeEmptyItems,
            #limit: limit,
          },
        ),
        returnValue: _i9.Future<List<_i23.AssetOhlcvModel>>.value(
            <_i23.AssetOhlcvModel>[]),
      ) as _i9.Future<List<_i23.AssetOhlcvModel>>);
}

/// A class which mocks [GetAllAssetsWithIcons].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllAssetsWithIcons extends _i1.Mock
    implements _i24.GetAllAssetsWithIcons {
  MockGetAllAssetsWithIcons() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.AssetRepository get assetRepository => (super.noSuchMethod(
        Invocation.getter(#assetRepository),
        returnValue: _FakeAssetRepository_1(
          this,
          Invocation.getter(#assetRepository),
        ),
      ) as _i3.AssetRepository);
  @override
  _i4.IconsRepository get iconsRepository => (super.noSuchMethod(
        Invocation.getter(#iconsRepository),
        returnValue: _FakeIconsRepository_2(
          this,
          Invocation.getter(#iconsRepository),
        ),
      ) as _i4.IconsRepository);
  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetEntity>>> call(
          List<String>? assetsIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [assetsIds],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetEntity>>>.value(
                _FakeEither_0<_i10.Failure, List<_i11.AssetEntity>>(
          this,
          Invocation.method(
            #call,
            [assetsIds],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i11.AssetEntity>>>);
}

/// A class which mocks [GetAssetOhlcv].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAssetOhlcv extends _i1.Mock implements _i25.GetAssetOhlcv {
  MockGetAssetOhlcv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.AssetOhlcvRepository get assetOhlcvRepository => (super.noSuchMethod(
        Invocation.getter(#assetOhlcvRepository),
        returnValue: _FakeAssetOhlcvRepository_3(
          this,
          Invocation.getter(#assetOhlcvRepository),
        ),
      ) as _i5.AssetOhlcvRepository);
  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i12.AssetOhlcvEntity>>> call(
    String? symbolId,
    String? periodId,
    DateTime? timeStart, {
    DateTime? timeEnd,
    bool? includeEmptyItems,
    int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            symbolId,
            periodId,
            timeStart,
          ],
          {
            #timeEnd: timeEnd,
            #includeEmptyItems: includeEmptyItems,
            #limit: limit,
          },
        ),
        returnValue: _i9.Future<
                _i2.Either<_i10.Failure, List<_i12.AssetOhlcvEntity>>>.value(
            _FakeEither_0<_i10.Failure, List<_i12.AssetOhlcvEntity>>(
          this,
          Invocation.method(
            #call,
            [
              symbolId,
              periodId,
              timeStart,
            ],
            {
              #timeEnd: timeEnd,
              #includeEmptyItems: includeEmptyItems,
              #limit: limit,
            },
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i12.AssetOhlcvEntity>>>);
}

/// A class which mocks [GetSymbols].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSymbols extends _i1.Mock implements _i26.GetSymbols {
  MockGetSymbols() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.SymbolRepository get symbolRepository => (super.noSuchMethod(
        Invocation.getter(#symbolRepository),
        returnValue: _FakeSymbolRepository_4(
          this,
          Invocation.getter(#symbolRepository),
        ),
      ) as _i6.SymbolRepository);
  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i14.SymbolEntity>>> call(
          String? assetId) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [assetId],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i14.SymbolEntity>>>.value(
                _FakeEither_0<_i10.Failure, List<_i14.SymbolEntity>>(
          this,
          Invocation.method(
            #call,
            [assetId],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i14.SymbolEntity>>>);
}

/// A class which mocks [GetAllPeriod].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllPeriod extends _i1.Mock implements _i27.GetAllPeriod {
  MockGetAllPeriod() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.PeriodRepository get periodRepository => (super.noSuchMethod(
        Invocation.getter(#periodRepository),
        returnValue: _FakePeriodRepository_5(
          this,
          Invocation.getter(#periodRepository),
        ),
      ) as _i7.PeriodRepository);
  @override
  _i9.Future<_i2.Either<_i10.Failure, List<_i13.PeriodEntity>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i9.Future<_i2.Either<_i10.Failure, List<_i13.PeriodEntity>>>.value(
                _FakeEither_0<_i10.Failure, List<_i13.PeriodEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i9.Future<_i2.Either<_i10.Failure, List<_i13.PeriodEntity>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i8.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i8.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i9.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i9.Future<_i8.Response>);
  @override
  _i9.Future<_i8.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i9.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i9.Future<_i8.Response>);
  @override
  _i9.Future<_i8.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i9.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i9.Future<_i8.Response>);
  @override
  _i9.Future<_i8.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i9.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i9.Future<_i8.Response>);
  @override
  _i9.Future<_i8.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i9.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i9.Future<_i8.Response>);
  @override
  _i9.Future<_i8.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i9.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i9.Future<_i8.Response>);
  @override
  _i9.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i9.Future<String>.value(''),
      ) as _i9.Future<String>);
  @override
  _i9.Future<_i29.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i9.Future<_i29.Uint8List>.value(_i29.Uint8List(0)),
      ) as _i9.Future<_i29.Uint8List>);
  @override
  _i9.Future<_i8.StreamedResponse> send(_i8.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i9.Future<_i8.StreamedResponse>.value(_FakeStreamedResponse_7(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i9.Future<_i8.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
