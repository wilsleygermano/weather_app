import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_call_use_case.dart';

import '../../domain/entities/city_entity.dart';

class FavoritePageStreamController {
  final _useCase = Modular.get<ApiCallUseCase>();
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final String temperatureUnit = "metric";
  List<CityEntity> provisoryCityList = [];
  List<CityEntity> finalCityList = [];


  Stream<List<CityEntity>> streamFavoriteCities() async* {
    

    final cities = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .get();

    final streamFavList =
List<CityEntity>.from(cities.docs.map((e) => CityEntity.fromFirestore(e.data())));

    for (var city in streamFavList) {
      final newCity = city.cityName!.replaceAll(" ", '%20').toLowerCase();
      final cityWithoutAccents = removeAccents(newCity);
      final resource = await _useCase.returnCityValues(cityWithoutAccents, temperatureUnit);
      if(resource.hasError) {
        //fazer algo a respeito
      }
      final cityData = resource.data;
      provisoryCityList.add(cityData!);
    }
    finalCityList = provisoryCityList;
    yield finalCityList;
    
  }

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
}
