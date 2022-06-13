import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/custom_favorite_card.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/dropdown_menu.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';
import 'dart:async';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();
  // final _favoriteStreamController = Modular.get<FavoritePageStreamController>();

  @override
  void initState() {
    _setupPage();
    super.initState();
  }

  _setupPage() async* {
    yield _controller.streamFavoriteCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundcolor,
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 80, 80, 32),
                    child: Observer(builder: (context) {
                      return GenericTextField(
                        textInputAction: TextInputAction.done,
                        onChanged: _controller.storeCityTyped,
                        suffixIconButton: Icons.search,
                        iconButtonPressed: () async {
                          final resource =
                              await _controller.fetchSearchedCity();
                          if (resource.hasError) {
                            //! fazer algo
                            return;
                          }
                          await Modular.to.pushNamed('/home/',
                              arguments: _controller.searchedCity);
                        },
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 48),
                  child: Observer(
                    builder: (context) {
                      return DropdownMenu(
                        );
                    }
                  ),
                )
              ],
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
                  IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        await Modular.to.pushReplacementNamed("/");
                      },
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
            ),
            const SizedBox(height: 30),
            Observer(builder: (context) {
              return StreamBuilder<List<CityEntity>>(
                stream: _controller.streamFavoriteCities(),
                builder: ((context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        children = <Widget>[
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.purple,
                              strokeWidth: 8.0,
                            ),
                          ),
                        ];
                        break;

                      case ConnectionState.none:
                        children = <Widget>[
                          const Center(child: Text("Don't know what happened"))
                        ];

                        break;
                      case ConnectionState.done:
                        children = <Widget>[
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: CustomFavoriteCard(
                                      onTap: () async {
                                        await Modular.to
                                            .pushReplacementNamed('/home/',
                                                arguments:
                                                    snapshot.data![index])
                                            .whenComplete(() => _controller
                                                .streamFavoriteCities());
                                      },
                                      cityName: snapshot.data![index].cityName!,
                                      countryName:
                                          snapshot.data![index].countryName!,
                                      temperature: snapshot
                                          .data![index].temperature!
                                          .toInt(),
                                          unitSymbol: _controller.unitSymbol,
                                    ));
                              })
                        ];

                        break;
                      case ConnectionState.active:
                        children = [
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                              strokeWidth: 8.0,
                            ),
                          )
                        ];
                        break;
                    }
                  }
                  return Column(
                    children: children,
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
