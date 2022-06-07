// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$temperatureAtom =
      Atom(name: '_HomePageControllerBase.temperature', context: context);

  @override
  double get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(double value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$returnCityValuesAsyncAction =
      AsyncAction('_HomePageControllerBase.returnCityValues', context: context);

  @override
  Future<void> returnCityValues(String city) {
    return _$returnCityValuesAsyncAction
        .run(() => super.returnCityValues(city));
  }

  @override
  String toString() {
    return '''
temperature: ${temperature}
    ''';
  }
}
