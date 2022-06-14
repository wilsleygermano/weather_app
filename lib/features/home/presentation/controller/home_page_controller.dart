import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

import '../../../../core/generics/resource.dart';
import '../../../favorite/data/api_call_error.dart';
import '../../../favorite/domain/entities/city_entity.dart';
import '../../../favorite/domain/use_cases/api_call_use_case.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final _useCase = Modular.get<ApiCallUseCase>();
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;

  var firestore = FirebaseFirestore.instance;

  @observable
  String mainDate = " ";

  @observable
  String fiveDaysForecastDate2 = " ";

  @observable
  String fiveDaysForecastDate3 = " ";

  @observable
  String fiveDaysForecastDate4 = " ";

  @observable
  String fiveDaysForecastDate5 = " ";

  @action
  formartMainDate(String dateTime) {
    return mainDate = DateFormat('EEEE, d').format(DateTime.parse(dateTime));
  }

  @action
  formartFiveDaysForecastDate2(String dateTime) {
    return fiveDaysForecastDate2 =
        DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @action
  formartFiveDaysForecastDate3(String dateTime) {
    return fiveDaysForecastDate3 =
        DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @action
  formartFiveDaysForecastDate4(String dateTime) {
    return fiveDaysForecastDate4 =
        DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @action
  fomartFiveDaysForecastDate5(String dateTime) {
    return fiveDaysForecastDate5 =
        DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @observable
  bool isFavorited = false;

  @action
  Future checkIfACityIsFavorited(String cityName) async {
    final docRef = await firestore
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .doc(cityName)
        .get()
        .then((value) => value.exists);

    if (docRef == true) {
      return isFavorited = true;
    }
    return isFavorited = false;
  }

  @action
  Future favoriteButtonPressed(
      String cityName, countryName, temperature) async {
    await firestore
        .collection("Users")
        .doc(currentUserId)
        .set({'id': currentUserId});

    final docRef = await firestore
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .doc(cityName)
        .get()
        .then((value) => value.exists);

    if (docRef == true) {
      return [
        await firestore
            .collection("Users")
            .doc(currentUserId)
            .collection("favorite_places")
            .doc(cityName)
            .delete(),
        isFavorited = false
      ];
    }
    return [
      await firestore
          .collection("Users")
          .doc(currentUserId)
          .collection("favorite_places")
          .doc(cityName)
          .set({
        'city_name': cityName,
        'country_name': countryName,
        'temperature': temperature,
      }),
      isFavorited = true
    ];
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
  String city = '';

  @observable
  CityEntity searchedCity = CityEntity();

  @action
  void storeCityTyped(String newValue) => city = newValue;

  @action
  Future<Resource<void, ApiCallError>> fetchSearchedCity(
      String temperatureUnit) async {
    final cityWithoutAccents = removeAccents(city);
    cityWithoutAccents.replaceAll(" ", '%20').toLowerCase();

    final resource =
        await _useCase.returnCityValues(cityWithoutAccents, temperatureUnit);

    if (resource.hasError) {
      return Resource.failed(error: ApiCallError.badRequest);
    }

    searchedCity = resource.data!;
    return Resource.success();
  }
}
