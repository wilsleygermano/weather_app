import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';
import 'package:weather_app/features/home/presentation/view/widgets/home_forecast_next_days_card.dart';
import 'package:weather_app/features/home/presentation/view/widgets/home_main_card.dart';

class HomePage extends StatefulWidget {
  final CityEntity city;
  const HomePage({Key? key, required this.city}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();

  @override
  void initState() {
    _controller.searchedCity = widget.city;
    _controller.formartMainDate(_controller.searchedCity.dateTime!);
    _controller.formartFiveDaysForecastDate2(_controller.searchedCity.dateTimeDay2!);
    _controller.formartFiveDaysForecastDate3(_controller.searchedCity.dateTimeDay3!);
    _controller.formartFiveDaysForecastDate4(_controller.searchedCity.dateTimeDay4!);
    _controller.fomartFiveDaysForecastDate5(_controller.searchedCity.dateTimeDay5!);
    _controller.checkIfACityIsFavorited(_controller.searchedCity.cityName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                          iconButtonPressed: () async {
                            setState(() async{
                              await _controller.fetchSearchedCity();
                              await _controller
                                .checkIfACityIsFavorited(_controller.searchedCity.cityName!);
                            });
                            
                          }),
                    ),
                    HomeMainCard(
                      cityName: _controller.searchedCity.cityName!,
                      dateTime: _controller.mainDate,
                      temperature: _controller.searchedCity.temperature!.toInt(),
                      humidity: _controller.searchedCity.humidity!,
                      windSpeed: _controller.searchedCity.windSpeed!,
                      feelsLike: _controller.searchedCity.feelsLike!,
                      unitSymbol: "C", //! LIDAR COM ISSO
                      dayMaximum: _controller.searchedCity.tempMax!.toInt(),
                      dayMinimum: _controller.searchedCity.tempMin!.toInt(),
                      weather: _controller.searchedCity.weather!,
                      onPressed: () async {
                        await _controller.favoriteButtonPressed(
                            _controller.searchedCity.cityName!,
                            _controller.searchedCity.countryName,
                            _controller.searchedCity.temperature);
                      },
                      isFavorited: _controller.isFavorited,
                    ),
                    HomeForecastNextDaysCard(
                      weather2: _controller.searchedCity.weather2!,
                      weather3: _controller.searchedCity.weather3!,
                      weather4: _controller.searchedCity.weather4!,
                      weather5: _controller.searchedCity.weather5!,
                      dateTimeDay2: _controller.fiveDaysForecastDate2,
                      temperatureDay2: _controller.searchedCity.temperatureDay2!,
                      dateTimeDay3: _controller.fiveDaysForecastDate3,
                      temperatureDay3: _controller.searchedCity.temperatureDay3!,
                      dateTimeDay4: _controller.fiveDaysForecastDate4,
                      temperatureDay4: _controller.searchedCity.temperatureDay4!,
                      dateTimeDay5: _controller.fiveDaysForecastDate5,
                      temperatureDay5: _controller.searchedCity.temperatureDay5!,
                      unitSymbol: "C", //! replace this
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
