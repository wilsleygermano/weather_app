// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritePageController on _FavoritePageControllerBase, Store {
  late final _$favoriteCitiesAtom = Atom(
      name: '_FavoritePageControllerBase.favoriteCities', context: context);

  @override
  ObservableList<CityEntity> get favoriteCities {
    _$favoriteCitiesAtom.reportRead();
    return super.favoriteCities;
  }

  @override
  set favoriteCities(ObservableList<CityEntity> value) {
    _$favoriteCitiesAtom.reportWrite(value, super.favoriteCities, () {
      super.favoriteCities = value;
    });
  }

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

  late final _$searchedCityAtom =
      Atom(name: '_FavoritePageControllerBase.searchedCity', context: context);

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

  late final _$weatherIconAtom =
      Atom(name: '_FavoritePageControllerBase.weatherIcon', context: context);

  @override
  String get weatherIcon {
    _$weatherIconAtom.reportRead();
    return super.weatherIcon;
  }

  @override
  set weatherIcon(String value) {
    _$weatherIconAtom.reportWrite(value, super.weatherIcon, () {
      super.weatherIcon = value;
    });
  }

  late final _$weatherIcon2Atom =
      Atom(name: '_FavoritePageControllerBase.weatherIcon2', context: context);

  @override
  String get weatherIcon2 {
    _$weatherIcon2Atom.reportRead();
    return super.weatherIcon2;
  }

  @override
  set weatherIcon2(String value) {
    _$weatherIcon2Atom.reportWrite(value, super.weatherIcon2, () {
      super.weatherIcon2 = value;
    });
  }

  late final _$weatherIcon3Atom =
      Atom(name: '_FavoritePageControllerBase.weatherIcon3', context: context);

  @override
  String get weatherIcon3 {
    _$weatherIcon3Atom.reportRead();
    return super.weatherIcon3;
  }

  @override
  set weatherIcon3(String value) {
    _$weatherIcon3Atom.reportWrite(value, super.weatherIcon3, () {
      super.weatherIcon3 = value;
    });
  }

  late final _$weatherIcon4Atom =
      Atom(name: '_FavoritePageControllerBase.weatherIcon4', context: context);

  @override
  String get weatherIcon4 {
    _$weatherIcon4Atom.reportRead();
    return super.weatherIcon4;
  }

  @override
  set weatherIcon4(String value) {
    _$weatherIcon4Atom.reportWrite(value, super.weatherIcon4, () {
      super.weatherIcon4 = value;
    });
  }

  late final _$weatherIcon5Atom =
      Atom(name: '_FavoritePageControllerBase.weatherIcon5', context: context);

  @override
  String get weatherIcon5 {
    _$weatherIcon5Atom.reportRead();
    return super.weatherIcon5;
  }

  @override
  set weatherIcon5(String value) {
    _$weatherIcon5Atom.reportWrite(value, super.weatherIcon5, () {
      super.weatherIcon5 = value;
    });
  }

  late final _$initialLabelIndexAtom = Atom(
      name: '_FavoritePageControllerBase.initialLabelIndex', context: context);

  @override
  int get initialLabelIndex {
    _$initialLabelIndexAtom.reportRead();
    return super.initialLabelIndex;
  }

  @override
  set initialLabelIndex(int value) {
    _$initialLabelIndexAtom.reportWrite(value, super.initialLabelIndex, () {
      super.initialLabelIndex = value;
    });
  }

  late final _$temperatureUnitAtom = Atom(
      name: '_FavoritePageControllerBase.temperatureUnit', context: context);

  @override
  String get temperatureUnit {
    _$temperatureUnitAtom.reportRead();
    return super.temperatureUnit;
  }

  @override
  set temperatureUnit(String value) {
    _$temperatureUnitAtom.reportWrite(value, super.temperatureUnit, () {
      super.temperatureUnit = value;
    });
  }

  late final _$unitSymbolAtom =
      Atom(name: '_FavoritePageControllerBase.unitSymbol', context: context);

  @override
  String get unitSymbol {
    _$unitSymbolAtom.reportRead();
    return super.unitSymbol;
  }

  @override
  set unitSymbol(String value) {
    _$unitSymbolAtom.reportWrite(value, super.unitSymbol, () {
      super.unitSymbol = value;
    });
  }

  @override
  ObservableStream<List<CityEntity>> streamFavoriteCities() {
    final _$stream = super.streamFavoriteCities();
    return ObservableStream<List<CityEntity>>(_$stream, context: context);
  }

  late final _$fetchSearchedCityAsyncAction = AsyncAction(
      '_FavoritePageControllerBase.fetchSearchedCity',
      context: context);

  @override
  Future<Resource<void, ApiCallError>> fetchSearchedCity() {
    return _$fetchSearchedCityAsyncAction.run(() => super.fetchSearchedCity());
  }

  late final _$getFavoriteCitiesAsyncAction = AsyncAction(
      '_FavoritePageControllerBase.getFavoriteCities',
      context: context);

  @override
  Future<ObservableList<CityEntity>> getFavoriteCities() {
    return _$getFavoriteCitiesAsyncAction.run(() => super.getFavoriteCities());
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
  String removeAccents(String wordWithAccents) {
    final _$actionInfo = _$_FavoritePageControllerBaseActionController
        .startAction(name: '_FavoritePageControllerBase.removeAccents');
    try {
      return super.removeAccents(wordWithAccents);
    } finally {
      _$_FavoritePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTemperatureUnitToImperial() {
    final _$actionInfo =
        _$_FavoritePageControllerBaseActionController.startAction(
            name:
                '_FavoritePageControllerBase.changeTemperatureUnitToImperial');
    try {
      return super.changeTemperatureUnitToImperial();
    } finally {
      _$_FavoritePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTemperatureUnitToMetric() {
    final _$actionInfo =
        _$_FavoritePageControllerBaseActionController.startAction(
            name: '_FavoritePageControllerBase.changeTemperatureUnitToMetric');
    try {
      return super.changeTemperatureUnitToMetric();
    } finally {
      _$_FavoritePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUnitSymbolToMetric() {
    final _$actionInfo =
        _$_FavoritePageControllerBaseActionController.startAction(
            name: '_FavoritePageControllerBase.changeUnitSymbolToMetric');
    try {
      return super.changeUnitSymbolToMetric();
    } finally {
      _$_FavoritePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUnitSymbolToImperial() {
    final _$actionInfo =
        _$_FavoritePageControllerBaseActionController.startAction(
            name: '_FavoritePageControllerBase.changeUnitSymbolToImperial');
    try {
      return super.changeUnitSymbolToImperial();
    } finally {
      _$_FavoritePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteCities: ${favoriteCities},
city: ${city},
searchedCity: ${searchedCity},
weatherIcon: ${weatherIcon},
weatherIcon2: ${weatherIcon2},
weatherIcon3: ${weatherIcon3},
weatherIcon4: ${weatherIcon4},
weatherIcon5: ${weatherIcon5},
initialLabelIndex: ${initialLabelIndex},
temperatureUnit: ${temperatureUnit},
unitSymbol: ${unitSymbol}
    ''';
  }
}
