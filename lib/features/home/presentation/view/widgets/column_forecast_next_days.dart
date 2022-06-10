import 'package:flutter/material.dart';

class ColumnForecastNextDays extends StatelessWidget {
  final String dateTime;
  final num temperature;
  final String unitSymbol;
  final String weather;

  const ColumnForecastNextDays(
      {Key? key,
      required this.dateTime,
      required this.temperature,
      required this.unitSymbol,
      required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dateTime,
          style: Theme.of(context).textTheme.headline5,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/weather_icons/$weather.png"),
            ),
          ),
        ),
        Text(
          "${temperature.toInt()} $unitSymbol",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
