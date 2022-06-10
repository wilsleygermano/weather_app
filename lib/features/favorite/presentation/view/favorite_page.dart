import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/custom_toggle_temperature.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/domain/entities/favorite_city_entity.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/controllers/get_favorite_cities_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/custom_favorite_card.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();
  final _homeController = Modular.get<HomePageController>();
  final _favoriteController = GetFavoriteCitiesController();

  @override
  void initState() {
    _setupPage();
    super.initState();
  }

  void _setupPage()async {
    await _controller.getFavoriteCities();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundcolor,
        body: Observer(builder: (context) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 120, 32),
              child: GenericTextField(
                textInputAction: TextInputAction.done,
                onChanged: _controller.storeCityTyped,
                suffixIconButton: Icons.search,
                iconButtonPressed: () async {
                  await _controller.returnCityValues(_controller.city);
                  await _homeController
                      .checkIfACityIsFavorited(_controller.cityName);
                },
              ),
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
            // CustomFavoriteCard(
            //   cityName: _controller.cityName,
            //   countryName: _controller.countryName,
            //   temperature: "${_controller.temperature.toInt()}"
            //       " ${_controller.unitSymbol}",
            // ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.favoriteCities.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomFavoriteCard(
                      cityName: _controller.favoriteCities[index].cityName!,
                      // cityName: _controller.cityName,
                      countryName: _controller.favoriteCities[index].countryName!,
                      // temperature: snapshot.data![index].temperature!.toString(),
                      // temperature: _controller.temperature.toString(),
                      temperature:
                          _controller.favoriteCities[index].temperature!,
                    ));
              },
            )
          ]);
        }));
  }
}
