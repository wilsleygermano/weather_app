import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/custom_toggle_temperature.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';
import 'package:weather_app/features/home/presentation/view/widgets/column_main_card.dart';
import 'package:weather_app/features/home/presentation/view/widgets/high_low_field.dart';

class HomeMainCard extends StatelessWidget {
  final String cityName;
  final String dateTime;
  final num temperature;
  final num humidity;
  final num windSpeed;
  final num feelsLike;
  final String unitSymbol;
  final int dayHighest;
  final int dayLowest;
  final String weatherIcon;

  const HomeMainCard({
    Key? key,
    required this.cityName,
    required this.dateTime,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.unitSymbol,
    required this.dayHighest,
    required this.dayLowest,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            "ºC",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const CustomToggleTemperature(
                          minWidth: 20.0,
                          minHeight: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("ºF",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ],
                    ),
                    Text(
                      cityName,
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateTime,
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        HighLowField(
                            dayHighAndLow: dayHighest, icon: Icons.arrow_upward),
                        HighLowField(
                            dayHighAndLow: dayLowest, icon: Icons.arrow_downward),
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
                      height: 45,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("lib/assets/weather_icons/$weatherIcon.png"),
                        ),
                      ),
                    )
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
            )),
        start: 0.3,
        end: 0.1,
        borderRadius: 20);
  }
}
