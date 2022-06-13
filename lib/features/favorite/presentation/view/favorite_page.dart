import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/custom_toggle_temperature.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/custom_favorite_card.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/dropdown_menu.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();

  @override
  void initState() {
    _setupPage();
    super.initState();
  }

  void _setupPage() async {
    await _controller.getFavoriteCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundcolor,
        body: Observer(builder: (context) {
          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 80, 80, 32),
                    child: GenericTextField(
                      textInputAction: TextInputAction.done,
                      onChanged: _controller.storeCityTyped,
                      suffixIconButton: Icons.search,
                      iconButtonPressed: () async {
                        final resource = await _controller.fetchSearchedCity();
                        if (resource.hasError) {
                          //! fazer algo
                          return;
                        }
                        await Modular.to.pushNamed('/home/',
                            arguments: _controller.searchedCity);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 48),
                  child: DropdownMenu(changeToCelsius: _controller.changeTemperatureUnitToMetric),
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.favoriteCities.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomFavoriteCard(
                      onTap: () {
                        Modular.to.pushNamed('/home/',
                            arguments: _controller.favoriteCities[index]);
                      },
                      cityName: _controller.favoriteCities[index].cityName!,
                      countryName:
                          _controller.favoriteCities[index].countryName!,
                      temperature: _controller.favoriteCities[index].temperature
                          .toString(),
                    ));
              },
            )
          ]);
        }));
  }
}
