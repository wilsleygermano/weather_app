import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';
import 'package:weather_app/features/home/presentation/view/widgets/column_main_card.dart';
import 'package:weather_app/features/home/presentation/view/widgets/favorite_button.dart';

class HomeMainCard extends StatelessWidget {
  final String cityName;
  final String dateTime;
  final int temperature;
  final num humidity;
  final num windSpeed;
  final num feelsLike;
  final String unitSymbol;
  final Function() onPressed;
  final bool isFavorited;
  final int dayMinimum;
  final int dayMaximum;
  final String weather;

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
    required this.dayMinimum,
    required this.dayMaximum,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(builder: (context) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "$dayMaximum",
                                  style: Theme.of(context).textTheme.headline3!,
                                ),
                                Icon(
                                  Icons.arrow_upward_outlined,
                                  size: 16,
                                  color: MyColors.primarywhite,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "$dayMinimum",
                                  style: Theme.of(context).textTheme.headline3!,
                                ),
                                Icon(
                                  Icons.arrow_downward_outlined,
                                  size: 16,
                                  color: MyColors.primarywhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "${temperature.toInt()} $unitSymbol",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/assets/weather_icons/$weather.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColumnMainCard(
                          valueName: 'Humidity',
                          value: humidity,
                          valueUnit: '%'),
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
            })),
        start: 0.3,
        end: 0.1,
        borderRadius: 20);
  }
}
