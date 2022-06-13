import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/custom_toggle_temperature.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_stream_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/custom_favorite_card.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();
  // final _favoriteStreamController = Modular.get<FavoritePageStreamController>();
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // _setupPage();
    streamFavoriteCities();
    super.initState();
  }

  // void _setupPage() async {
  //   await _controller.getFavoriteCities();
  // }

  Stream<List<CityEntity>> streamFavoriteCities() async* {
    final cities = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .collection("favorite_places")
        .get();

    final streamFavList = List<CityEntity>.from(
        cities.docs.map((e) => CityEntity.fromFirestore(e.data())));

    // cities.docs.map((e) => CityEntity.fromFirestore(e.data())).toList();

    yield streamFavList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 120, 32),
              child: Observer(builder: (_) {
                return GenericTextField(
                  textInputAction: TextInputAction.done,
                  onChanged: _controller.storeCityTyped,
                  suffixIconButton: Icons.search,
                  iconButtonPressed: () async {
                    final resource = await _controller.fetchSearchedCity();
                    if (resource.hasError) {
                      //! fazer algo
                      return;
                    }
                    await Modular.to.pushReplacementNamed('/home/',
                        arguments: _controller.searchedCity);
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Locations',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const CustomToggleTemperature(
                    minWidth: 40.0,
                    minHeight: 40.0,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            StreamBuilder<List<CityEntity>>(
              stream: streamFavoriteCities(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CustomFavoriteCard(
                            onTap: () async {
                              await Modular.to.pushNamed('/home/',
                                  arguments:
                                      // _controller.favoriteCities[index]
                                      snapshot.data![index]);
                            },
                            cityName: snapshot.data![index].cityName!,
                            // _controller
                            //     .favoriteCities[index].cityName!,
                            countryName: snapshot.data![index].countryName!,
                            // _controller
                            //     .favoriteCities[index].countryName!,
                            temperature:
                                snapshot.data![index].temperature!.toInt(),
                            // _controller
                            //     .favoriteCities[index].temperature!
                            //     .toInt()),
                          ));
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error${snapshot.error}"),
                  );

                  // Dialog(
                  //   backgroundColor: Colors.white,
                  //   elevation: 8,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(16),
                  //   ),
                  //   child: ElevatedButton(
                  //     child: const Text(
                  //         "Something went wrong, please try again later"),
                  //     onPressed: () {
                  //       debugPrint("oi");
                  //     },
                  //   ),
                  // );

                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No data found"),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                    strokeWidth: 8.0,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
