import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/core/widgets/custom_toggle_temperature.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';
import 'package:weather_app/features/home/presentation/view/widgets/column_main_card.dart';
import 'package:weather_app/features/home/presentation/view/widgets/favorite_button.dart';

class HomeMainCard extends StatelessWidget {
  final String cityName;
  final String dateTime;
  final num temperature;
  final num humidity;
  final num windSpeed;
  final num feelsLike;
  final String unitSymbol;
  final Function() onPressed;
  final bool isFavorited;
  const HomeMainCard({
    Key? key,
    required this.cityName,
    required this.dateTime,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.unitSymbol,
    required this.onPressed,
    required this.isFavorited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(
              builder: (context) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomToggleTemperature(
                          minWidth: 20.0,
                          minHeight: 20.0,
                        ),
                        FavoriteButton(
                            onPressed: onPressed, isFavorited: isFavorited)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              dateTime,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              cityName,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 42),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${temperature.toInt()} $unitSymbol",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnMainCard(
                            valueName: 'Humidity', value: humidity, valueUnit: '%'),
                        ColumnMainCard(
                            valueName: 'Wind speed',
                            value: windSpeed,
                            valueUnit: ' km/h'),
                        ColumnMainCard(
                            valueName: 'Feels like',
                            value: feelsLike,
                            valueUnit: ' º'),
                      ],
                    )
                  ],
                );
              }
            )),
        start: 0.3,
        end: 0.1,
        borderRadius: 20);
  }
}
