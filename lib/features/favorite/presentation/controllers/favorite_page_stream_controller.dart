import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/city_entity.dart';

class FavoritePageStreamController {
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;

  Stream<List<CityEntity>> streamFavoriteCities() async* {
    

    final cities = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .get();

    final streamFavList =
List<CityEntity>.from(cities.docs.map((e) => CityEntity.fromFirestore(e.data())));


        // cities.docs.map((e) => CityEntity.fromFirestore(e.data())).toList();

    yield streamFavList;
  }
}
