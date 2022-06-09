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
  const HomeForecastNextDaysCard({Key? key,
  required this.dateTimeDay2,
  required this.temperatureDay2,
  required this.dateTimeDay3,
  required this.temperatureDay3,
  required this.dateTimeDay4,
  required this.temperatureDay4,
  required this.dateTimeDay5,
  required this.temperatureDay5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 32),
      child: GlassMorphism(
          child: SizedBox(
            height: 110,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                    ColumnForecastNextDays(
                    dateTime: dateTimeDay2, 
                    temperature: temperatureDay2),
                    ColumnForecastNextDays(
                    dateTime: dateTimeDay3, 
                    temperature: temperatureDay3),
                    ColumnForecastNextDays(
                    dateTime: dateTimeDay4, 
                    temperature: temperatureDay4),
                    ColumnForecastNextDays(
                    dateTime: dateTimeDay5, 
                    temperature: temperatureDay5,),
                ],
              ),
            ),
          ),
          start: 0.3,
          end: 0.1,
          borderRadius: 10),
    );
  }
}
