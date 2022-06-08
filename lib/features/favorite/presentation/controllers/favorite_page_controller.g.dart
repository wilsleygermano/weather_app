// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritePageController on _FavoritePageControllerBase, Store {
  late final _$cityAtom =
      Atom(name: '_FavoritePageControllerBase.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: '_FavoritePageControllerBase.cityName', context: context);

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

  late final _$countryNameAtom =
      Atom(name: '_FavoritePageControllerBase.countryName', context: context);

  @override
  String get countryName {
    _$countryNameAtom.reportRead();
    return super.countryName;
  }

  @override
  set countryName(String value) {
    _$countryNameAtom.reportWrite(value, super.countryName, () {
      super.countryName = value;
    });
  }

  late final _$temperatureAtom =
      Atom(name: '_FavoritePageControllerBase.temperature', context: context);

  @override
  num get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(num value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$returnCityValuesAsyncAction = AsyncAction(
      '_FavoritePageControllerBase.returnCityValues',
      context: context);

  @override
  Future<Resource<void, ApiCallError>> returnCityValues(String city) {
    return _$returnCityValuesAsyncAction
        .run(() => super.returnCityValues(city));
  }

  late final _$_FavoritePageControllerBaseActionController =
      ActionController(name: '_FavoritePageControllerBase', context: context);

  @override
  void storeCityTyped(String newValue) {
    final _$actionInfo = _$_FavoritePageControllerBaseActionController
        .startAction(name: '_FavoritePageControllerBase.storeCityTyped');
    try {
      return super.storeCityTyped(newValue);
    } finally {
      _$_FavoritePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
city: ${city},
cityName: ${cityName},
countryName: ${countryName},
temperature: ${temperature}
    ''';
  }
}
