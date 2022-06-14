// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$mainDateAtom =
      Atom(name: '_HomePageControllerBase.mainDate', context: context);

  @override
  String get mainDate {
    _$mainDateAtom.reportRead();
    return super.mainDate;
  }

  @override
  set mainDate(String value) {
    _$mainDateAtom.reportWrite(value, super.mainDate, () {
      super.mainDate = value;
    });
  }

  late final _$fiveDaysForecastDate2Atom = Atom(
      name: '_HomePageControllerBase.fiveDaysForecastDate2', context: context);

  @override
  String get fiveDaysForecastDate2 {
    _$fiveDaysForecastDate2Atom.reportRead();
    return super.fiveDaysForecastDate2;
  }

  @override
  set fiveDaysForecastDate2(String value) {
    _$fiveDaysForecastDate2Atom.reportWrite(value, super.fiveDaysForecastDate2,
        () {
      super.fiveDaysForecastDate2 = value;
    });
  }

  late final _$fiveDaysForecastDate3Atom = Atom(
      name: '_HomePageControllerBase.fiveDaysForecastDate3', context: context);

  @override
  String get fiveDaysForecastDate3 {
    _$fiveDaysForecastDate3Atom.reportRead();
    return super.fiveDaysForecastDate3;
  }

  @override
  set fiveDaysForecastDate3(String value) {
    _$fiveDaysForecastDate3Atom.reportWrite(value, super.fiveDaysForecastDate3,
        () {
      super.fiveDaysForecastDate3 = value;
    });
  }

  late final _$fiveDaysForecastDate4Atom = Atom(
      name: '_HomePageControllerBase.fiveDaysForecastDate4', context: context);

  @override
  String get fiveDaysForecastDate4 {
    _$fiveDaysForecastDate4Atom.reportRead();
    return super.fiveDaysForecastDate4;
  }

  @override
  set fiveDaysForecastDate4(String value) {
    _$fiveDaysForecastDate4Atom.reportWrite(value, super.fiveDaysForecastDate4,
        () {
      super.fiveDaysForecastDate4 = value;
    });
  }

  late final _$fiveDaysForecastDate5Atom = Atom(
      name: '_HomePageControllerBase.fiveDaysForecastDate5', context: context);

  @override
  String get fiveDaysForecastDate5 {
    _$fiveDaysForecastDate5Atom.reportRead();
    return super.fiveDaysForecastDate5;
  }

  @override
  set fiveDaysForecastDate5(String value) {
    _$fiveDaysForecastDate5Atom.reportWrite(value, super.fiveDaysForecastDate5,
        () {
      super.fiveDaysForecastDate5 = value;
    });
  }

  late final _$isFavoritedAtom =
      Atom(name: '_HomePageControllerBase.isFavorited', context: context);

  @override
  bool get isFavorited {
    _$isFavoritedAtom.reportRead();
    return super.isFavorited;
  }

  @override
  set isFavorited(bool value) {
    _$isFavoritedAtom.reportWrite(value, super.isFavorited, () {
      super.isFavorited = value;
    });
  }

  late final _$cityAtom =
      Atom(name: '_HomePageControllerBase.city', context: context);

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

  late final _$searchedCityAtom =
      Atom(name: '_HomePageControllerBase.searchedCity', context: context);

  @override
  CityEntity get searchedCity {
    _$searchedCityAtom.reportRead();
    return super.searchedCity;
  }

  @override
  set searchedCity(CityEntity value) {
    _$searchedCityAtom.reportWrite(value, super.searchedCity, () {
      super.searchedCity = value;
    });
  }

  late final _$checkIfACityIsFavoritedAsyncAction = AsyncAction(
      '_HomePageControllerBase.checkIfACityIsFavorited',
      context: context);

  @override
  Future<dynamic> checkIfACityIsFavorited(String cityName) {
    return _$checkIfACityIsFavoritedAsyncAction
        .run(() => super.checkIfACityIsFavorited(cityName));
  }

  late final _$favoriteButtonPressedAsyncAction = AsyncAction(
      '_HomePageControllerBase.favoriteButtonPressed',
      context: context);

  @override
  Future<dynamic> favoriteButtonPressed(
      String cityName, dynamic countryName, dynamic temperature) {
    return _$favoriteButtonPressedAsyncAction.run(
        () => super.favoriteButtonPressed(cityName, countryName, temperature));
  }

  late final _$fetchSearchedCityAsyncAction = AsyncAction(
      '_HomePageControllerBase.fetchSearchedCity',
      context: context);

  @override
  Future<Resource<void, ApiCallError>> fetchSearchedCity(
      String temperatureUnit) {
    return _$fetchSearchedCityAsyncAction
        .run(() => super.fetchSearchedCity(temperatureUnit));
  }

  late final _$_HomePageControllerBaseActionController =
      ActionController(name: '_HomePageControllerBase', context: context);

  @override
  dynamic formartMainDate(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.formartMainDate');
    try {
      return super.formartMainDate(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic formartFiveDaysForecastDate2(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.formartFiveDaysForecastDate2');
    try {
      return super.formartFiveDaysForecastDate2(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic formartFiveDaysForecastDate3(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.formartFiveDaysForecastDate3');
    try {
      return super.formartFiveDaysForecastDate3(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic formartFiveDaysForecastDate4(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.formartFiveDaysForecastDate4');
    try {
      return super.formartFiveDaysForecastDate4(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fomartFiveDaysForecastDate5(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.fomartFiveDaysForecastDate5');
    try {
      return super.fomartFiveDaysForecastDate5(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String removeAccents(String wordWithAccents) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.removeAccents');
    try {
      return super.removeAccents(wordWithAccents);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void storeCityTyped(String newValue) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.storeCityTyped');
    try {
      return super.storeCityTyped(newValue);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mainDate: ${mainDate},
fiveDaysForecastDate2: ${fiveDaysForecastDate2},
fiveDaysForecastDate3: ${fiveDaysForecastDate3},
fiveDaysForecastDate4: ${fiveDaysForecastDate4},
fiveDaysForecastDate5: ${fiveDaysForecastDate5},
isFavorited: ${isFavorited},
city: ${city},
searchedCity: ${searchedCity}
    ''';
  }
}
