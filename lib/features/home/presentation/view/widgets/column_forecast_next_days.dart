import 'package:flutter/material.dart';

class ColumnForecastNextDays extends StatelessWidget {
  final String dateTime;
  final num temperature;
  const ColumnForecastNextDays({ Key? key,
  required this.dateTime,
  required this.temperature,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dateTime, style: Theme.of(context).textTheme.headline6,),
        const Spacer(),
        Text(temperature.toString(), style: Theme.of(context).textTheme.headline6,),
      ],
    );
  }
}