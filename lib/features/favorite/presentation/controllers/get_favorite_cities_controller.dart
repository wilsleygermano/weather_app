import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/domain/entities/favorite_city_entity.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

// class GetFavoriteCitiesController {
//   final _controller = Modular.get<FavoritePageController>();
//   var currentUserId = FirebaseAuth.instance.currentUser!.uid;
//   Stream<List<FavoriteCityEntity>> getFavoriteCities() async* {
//     List<FavoriteCityEntity> favoriteCities = [];

//     final cities = await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(currentUserId)
//         .collection("favorite_places")
//         .get();

//     favoriteCities =
//         cities.docs.map((e) => FavoriteCityEntity.fromJson(e.data())).toList();
//     for (int i = 0; i < favoriteCities.length; i++) {
//       await _controller.returnCityValues(favoriteCities[i].toString());

//     }
//       yield favoriteCities;

//   }
// }

    // Future<void> loadFavoriteCities()async{
    //   for(int i = 0; i < favoriteCities2.length; i++ ){
    //     await _controller.returnCityValues(favoriteCities2[i].toString());
    //   }
    // }

    class GetFavoriteCitiesController {
  final _controller = Modular.get<FavoritePageController>();
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;
  Future<List<FavoriteCityEntity>> getFavoriteCities() async {
    List<FavoriteCityEntity> favoriteCities = [];

    final cities = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .get();

    favoriteCities =
        cities.docs.map((e) => FavoriteCityEntity.fromJson(e.data())).toList();
    for (int i = 0; i < favoriteCities.length; i++){
     await _controller.returnCityValues(favoriteCities[i].toString());

    }
      return favoriteCities;

  }
}
