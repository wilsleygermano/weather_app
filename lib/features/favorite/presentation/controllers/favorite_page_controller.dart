import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_call_use_case.dart';
part 'favorite_page_controller.g.dart';

class FavoritePageController = _FavoritePageControllerBase
    with _$FavoritePageController;

abstract class _FavoritePageControllerBase with Store {
  final _useCase = Modular.get<ApiCallUseCase>();
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @observable
  ObservableList<CityEntity> favoriteCities =
      ObservableList<CityEntity>.of([]);

  @observable
  String city = '';

  @observable
  CityEntity searchedCity = CityEntity();

  @action
  void storeCityTyped(String newValue) => city = newValue;

  @action
  Future<Resource<void, ApiCallError>> fetchSearchedCity() async {
    final cityWithoutAccents = removeAccents(city);
    cityWithoutAccents.replaceAll(" ", '%20').toLowerCase();

    final resource = await _useCase.returnCityValues(cityWithoutAccents, temperatureUnit);

    if(resource.hasError) {
      return Resource.failed(error: ApiCallError.badRequest);
    }

    searchedCity = resource.data!;
    return Resource.success();

  }

  @action
  String removeAccents(String wordWithAccents) {
    var _comAcento =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var _semAcento =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
    for (int i = 0; i < _comAcento.length; i++) {
      wordWithAccents =
          wordWithAccents.replaceAll(_comAcento[i], _semAcento[i]);
    }
    return wordWithAccents;
  }


  @observable
  int initialLabelIndex = 1;

  @observable
  String temperatureUnit = "imperial";

  @observable
  String unitSymbol = "ºF";

  @action
  void changeTemperatureUnitToImperial() {
    temperatureUnit = "imperial";
    initialLabelIndex = 1;
  }

  @action
  void changeTemperatureUnitToMetric() {
    temperatureUnit = "metric";
    initialLabelIndex = 0;
  }

  @action
  void changeUnitSymbolToMetric() {
    unitSymbol = "ºC";
  }

  @action
  void changeUnitSymbolToImperial() {
    unitSymbol = "ºF";
  }

  @action
  Future<ObservableList<CityEntity>> getFavoriteCities() async {
    final cities = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .get();

    favoriteCities = cities.docs
        .map((e) => CityEntity.fromFirestore(e.data()))
        .toList()
        .asObservable();

    ObservableList<CityEntity> provisoryCityList = <CityEntity>[].asObservable();
    for (var city in favoriteCities) {
      final newCity = city.cityName!.replaceAll(" ", '%20').toLowerCase();
      final cityWithoutAccents = removeAccents(newCity);
      final resource = await _useCase.returnCityValues(cityWithoutAccents, temperatureUnit);
      if(resource.hasError) {
        //fazer algo a respeito
      }
      final cityData = resource.data;
      provisoryCityList.add(cityData!);
    }
    favoriteCities = provisoryCityList;
    return favoriteCities;
  }
}
