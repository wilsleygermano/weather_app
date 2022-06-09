// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/widgets/custom_favorite_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body: Observer(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 120, 32),
              child: GenericTextField(
                textInputAction: TextInputAction.done,
                onChanged: _controller.storeCityTyped,
                suffixIconButton: Icons.search,
                iconButtonPressed: () {
                  _controller.returnCityValues(_controller.city);
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
                  ToggleSwitch(
                    borderColor: [
                      Colors.white,
                    ],
                    borderWidth: 1,
                    minWidth: 40.0,
                    cornerRadius: 20.0,
                    activeBgColor: [Colors.purple],
                    activeFgColor: Colors.white,
                    inactiveBgColor: const Color(0XFFC2AFEC),
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: _controller.initialLabelIndex,
                    totalSwitches: 2,
                    labels: ['ºC', 'ºF'],
                    radiusStyle: true,
                    onToggle: (index) async {
                      if (index == 0) {
                        _controller.changeTemperatureUnitToMetric();
                        await _controller.returnCityValues(_controller.city);
                        _controller.changeUnitSymbolToMetric();
                      }
                      if (index == 1) {
                        _controller.changeTemperatureUnitToImperial();
                        await _controller.returnCityValues(_controller.city);
                        _controller.changeUnitSymbolToImperial();
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomFavoriteCard(
              cityName: _controller.cityName,
              countryName: _controller.countryName,
              temperature: "${_controller.temperature.toInt()}" " ${_controller.unitSymbol}",
              onTap: () {
                Modular.to.pushNamed('/home/');
              },
            )
          ],
        );
      }),
    );
  }
}
