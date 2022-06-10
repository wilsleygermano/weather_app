import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';
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
  final _homeController = Modular.get<HomePageController>();

  @override
  void initState() {
    _homeController.formartMainDate(_controller.dateTime);
    _homeController.formartFiveDaysForecastDate2(_controller.dateTimeDay2);
    _homeController.formartFiveDaysForecastDate3(_controller.dateTimeDay3);
    _homeController.formartFiveDaysForecastDate4(_controller.dateTimeDay4);
    _homeController.fomartFiveDaysForecastDate5(_controller.dateTimeDay5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundcolor,
        body: SafeArea(
          child: Center(
            child: Observer(builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
                      child: GenericTextField(
                          textInputAction: TextInputAction.done,
                          onChanged: _controller.storeCityTyped,
                          suffixIconButton: Icons.search,
                          iconButtonPressed: () {
                            _controller.returnCityValues(_controller.city);
                          }),
                    ),
                    HomeMainCard(
                        cityName: _controller.cityName,
                        dateTime: _homeController.mainDate,
                        temperature: _controller.temperature,
                        humidity: _controller.humidity,
                        windSpeed: _controller.windSpeed,
                        feelsLike: _controller.feelsLike,
                        unitSymbol: _controller.unitSymbol,
                        dayHighest: _controller.tempMax.toInt(),
                        dayLowest: _controller.tempMin.toInt(),
                        weatherIcon: _controller.weatherIcon,
                        ),
                    HomeForecastNextDaysCard(
                        dateTimeDay2: _homeController.fiveDaysForecastDate2,
                        temperatureDay2: _controller.temperatureDay2,
                        dateTimeDay3: _homeController.fiveDaysForecastDate3,
                        temperatureDay3: _controller.temperatureDay3,
                        dateTimeDay4: _homeController.fiveDaysForecastDate4,
                        temperatureDay4: _controller.temperatureDay4,
                        dateTimeDay5: _homeController.fiveDaysForecastDate5,
                        temperatureDay5: _controller.temperatureDay5,
                        unitSymbol: _controller.unitSymbol,
                        )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
