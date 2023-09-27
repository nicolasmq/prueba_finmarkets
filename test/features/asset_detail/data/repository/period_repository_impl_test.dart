

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/period_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/repository/period_repository_impl.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main () {

  late MockPeriodRemoteDataSource mockPeriodRemoteDataSource;
  late PeriodRepositoryImpl periodRepositoryImpl;

  setUp(() {
    mockPeriodRemoteDataSource = MockPeriodRemoteDataSource();
    periodRepositoryImpl = PeriodRepositoryImpl(mockPeriodRemoteDataSource);
  });

  final testPeriodsModel = <PeriodModel>[
    const PeriodModel(
      periodId: "1SEC",
      lengthSeconds: 1,
      lengthMonths: 0,
      unitCount: 1,
      unitName: "second",
      displayName: "1 Second",
    )
  ];

  final testPeriodsEntity = <PeriodEntity>[
    const PeriodEntity(
      periodId: "1SEC",
      lengthSeconds: 1,
      lengthMonths: 0,
      unitCount: 1,
      unitName: "second",
      displayName: "1 Second",
    )
  ];

  test("should return all periods when a call to data source is successful",
          () async {
        // arrange
        when(mockPeriodRemoteDataSource.getAllPeriods())
            .thenAnswer((_) async => testPeriodsModel);
        // act
        final result = await periodRepositoryImpl.getPeriods();
        // assert
        expect(result.fold((failure) => failure, (assets) => assets),
            equals(testPeriodsEntity));
      });

}