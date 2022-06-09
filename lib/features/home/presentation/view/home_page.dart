import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/home/presentation/view/widgets/home_forecast_next_days_card.dart';
import 'package:weather_app/features/home/presentation/view/widgets/home_main_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<FavoritePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundcolor,
        body: Observer(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(56, 80, 56, 0),
                child: GenericTextField(
                    textInputAction: TextInputAction.done,
                    onChanged: _controller.storeCityTyped,
                    suffixIconButton: Icons.search,
                    iconButtonPressed: () {
                      _controller.returnCityValues(_controller.city);
                    }),
              ),
              const Spacer(),
              HomeMainCard(
                  cityName: _controller.cityName,
                  dateTime: _controller.dateTime,
                  temperature: _controller.temperature,
                  humidity: _controller.humidity,
                  windSpeed: _controller.windSpeed,
                  feelsLike: _controller.feelsLike),
              const Spacer(),
              HomeForecastNextDaysCard(
                dateTimeDay2: _controller.dateTimeDay2, 
                temperatureDay2: _controller.temperatureDay2, 
                dateTimeDay3: _controller.dateTimeDay3, 
                temperatureDay3: _controller.temperatureDay3, 
                dateTimeDay4: _controller.dateTimeDay4, 
                temperatureDay4: _controller.temperatureDay4, 
                dateTimeDay5: _controller.dateTimeDay5, 
                temperatureDay5: _controller.temperatureDay5)
            ],
          );
        }));
  }
}
