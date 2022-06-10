import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
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
  Future favoriteButtonPressed(String cityName, countryName, temperature) async {
    await firestore.collection("Users").doc(currentUserId).set({'id': currentUserId});

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
}
