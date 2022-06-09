import 'package:flutter/material.dart';

class ColumnForecastNextDays extends StatelessWidget {
  final String dateTime;
  final num temperature;
  final String unitSymbol;
  const ColumnForecastNextDays({
    Key? key,
    required this.dateTime,
    required this.temperature,
    required this.unitSymbol
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dateTime,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          "${temperature.toInt()} $unitSymbol",
          style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
