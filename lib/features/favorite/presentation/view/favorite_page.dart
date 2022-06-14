import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/custom_favorite_card.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/dropdown_menu.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();

  @override
  void initState() {
    _controller.getFavoriteCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  child: Observer(builder: (context) {
                    return const DropdownMenu();
                  }),
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
                ],
              ),
            ),
            const SizedBox(height: 30),
            Observer(builder: (context) {
              if (_controller.favoriteCities.isEmpty) {
                return Center(
                  child: Text(
                    "You still don't have favorite locations to show.\n"
                    "\n"
                    "Try searching for a place first.",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.favoriteCities.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: const StretchMotion(),
                    
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) {
                              _controller.deleteFavoriteCard(
                                  _controller.favoriteCities[index].cityName!);
                              setState(() {
                                _controller.getFavoriteCities();
                              });
                            },
                            backgroundColor: MyColors.primarywhite,
                            foregroundColor: MyColors.backgroundcolor,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: CustomFavoriteCard(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));
                          await Modular.to
                              .pushReplacementNamed('/home/',
                                  arguments: _controller.favoriteCities[index])
                              .whenComplete(
                                  () => _controller.getFavoriteCities());
                        },
                        cityName: _controller.favoriteCities[index].cityName!,
                        countryName:
                            _controller.favoriteCities[index].countryName!,
                        temperature: _controller
                            .favoriteCities[index].temperature!
                            .toInt(),
                        unitSymbol: _controller.unitSymbol,
                      ),
                    ),
                  );
                },
              );
            })

            // Observer(builder: (context) {
            //   return FutureBuilder<List<CityEntity>>(
            //     future: _controller.getFavoriteCities(),
            //     builder: ((context, snapshot) {
            //       List<Widget> children;
            //       if (snapshot.hasError) {
            //         return const Center(child: Text("Something went wrong"));
            //       } else {
            //         switch (snapshot.connectionState) {
            //           case ConnectionState.waiting:
            //             children = <Widget>[
            //               const Center(
            //                 child: CircularProgressIndicator(
            //                   color: Colors.purple,
            //                   strokeWidth: 8.0,
            //                 ),
            //               ),
            //             ];
            //             break;

            //           case ConnectionState.none:
            //             children = <Widget>[
            //               const Center(child: Text("Don't know what happened"))
            //             ];

            //             break;
            //           case ConnectionState.done:
            //             children = <Widget>[
            //               ListView.builder(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   itemCount: snapshot.data!.length,
            //                   shrinkWrap: true,
            //                   itemBuilder: (context, index) {
            //                     return Padding(
            //                         padding:
            //                             const EdgeInsets.only(bottom: 16.0),
            //                         child: CustomFavoriteCard(
            //                           onTap: () async {
            //                             await Modular.to
            //                                 .pushReplacementNamed('/home/',
            //                                     arguments:
            //                                         snapshot.data![index])
            //                                 .whenComplete(() => _controller
            //                                     .getFavoriteCities());
            //                           },
            //                           cityName: snapshot.data![index].cityName!,
            //                           countryName:
            //                               snapshot.data![index].countryName!,
            //                           temperature: snapshot
            //                               .data![index].temperature!
            //                               .toInt(),
            //                           unitSymbol: _controller.unitSymbol,
            //                         ));
            // //                   })
            //             ];

            //             break;
            //           case ConnectionState.active:
            //             children = [
            //               const Center(
            //                 child: CircularProgressIndicator(
            //                   color: Colors.yellow,
            //                   strokeWidth: 8.0,
            //                 ),
            //               )
            //             ];
            //             break;
            //         }
            //       }
            //       return Column(
            //         children: children,
            //       );
            //     }),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
