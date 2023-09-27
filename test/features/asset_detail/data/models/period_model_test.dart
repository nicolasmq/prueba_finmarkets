
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_finmarkets/features/asset_detail/data/models/period_model.dart';
import 'package:prueba_finmarkets/features/asset_detail/domain/entities/period_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

import '../../../../helpers/testing_data/json_reader.dart';

void main() {

  const testPeriodModel = PeriodModel(
    periodId: "1SEC",
    lengthSeconds: 1,
    lengthMonths: 0,
    unitCount: 1,
    unitName: "second",
    displayName: "1 Second",
  );

  final testPeriods = <PeriodModel>[
    const PeriodModel(
      periodId: "1SEC",
      lengthSeconds: 1,
      lengthMonths: 0,
      unitCount: 1,
      unitName: "second",
      displayName: "1 Second",
    )
  ];

  test('should be a subclass of asset entity', () {

    //assert
    expect(testPeriodModel, isA<PeriodEntity>());
  });

  test('should return a list from json', () {

    // arrange
    final List<dynamic> jsonList = json.decode(
        readJson('helpers/testing_data/testing_periods_response.json')
    );
    // act
    final result = jsonList.map((data) => PeriodModel.fromMap(data)).toList();
    // assert
    expect(result, equals(testPeriods));
  });



}