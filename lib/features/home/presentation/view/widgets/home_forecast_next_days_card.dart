import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';
import 'package:weather_app/features/home/presentation/view/widgets/column_forecast_next_days.dart';

class HomeForecastNextDaysCard extends StatelessWidget {
  final String dateTimeDay2;
  final num temperatureDay2;
  final String dateTimeDay3;
  final num temperatureDay3;
  final String dateTimeDay4;
  final num temperatureDay4;
  final String dateTimeDay5;
  final num temperatureDay5;
  final String unitSymbol;
  final String weather2;
  final String weather3;
  final String weather4;
  final String weather5;

  const HomeForecastNextDaysCard({
    Key? key,
    required this.dateTimeDay2,
    required this.temperatureDay2,
    required this.dateTimeDay3,
    required this.temperatureDay3,
    required this.dateTimeDay4,
    required this.temperatureDay4,
    required this.dateTimeDay5,
    required this.temperatureDay5,
    required this.unitSymbol,
    required this.weather2,
    required this.weather3,
    required this.weather4,
    required this.weather5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        child: SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ColumnForecastNextDays(
                  weather: weather2,
                  dateTime: dateTimeDay2,
                  temperature: temperatureDay2,
                  unitSymbol: unitSymbol,
                ),
                ColumnForecastNextDays(
                  weather: weather3,
                  dateTime: dateTimeDay3,
                  temperature: temperatureDay3,
                  unitSymbol: unitSymbol,
                ),
                ColumnForecastNextDays(
                  weather: weather4,
                  dateTime: dateTimeDay4,
                  temperature: temperatureDay4,
                  unitSymbol: unitSymbol,
                ),
                ColumnForecastNextDays(
                  weather: weather5,
                  dateTime: dateTimeDay5,
                  temperature: temperatureDay5,
                  unitSymbol: unitSymbol,
                ),
              ],
            ),
          ),
        ),
        start: 0.3,
        end: 0.1,
        borderRadius: 10);
  }
}
