import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/usecases/get_all_periods.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockPeriodRepository mockPeriodRepository;
  late GetAllPeriod getAllPeriod;

  setUp(() {
    mockPeriodRepository = MockPeriodRepository();
    getAllPeriod = GetAllPeriod(periodRepository: mockPeriodRepository);
  });

  final testPeriods = <PeriodEntity>[
    const PeriodEntity(
      periodId: "1SEC",
      lengthSeconds: 1,
      lengthMonths: 0,
      unitCount: 1,
      unitName: "second",
      displayName: "1 Second",
    )
  ];

  test("should return all period of time", () async {

    //arrange
    when(mockPeriodRepository.getPeriods())
        .thenAnswer((_) async => Right(testPeriods));
    //act
    final result = await getAllPeriod.call();

    //assert
    expect(result, equals(Right(testPeriods)));
  });
}
