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
  const HomePage({
    Key? key,
    required this.city
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<FavoritePageController>();
  final _homeController = Modular.get<HomePageController>();

  @override
  void initState() {
    _homeController.fomartMainDate(widget.city.dateTime!);
    _homeController.fomartFiveDaysForecastDate2(widget.city.dateTimeDay2!);
    _homeController.fomartFiveDaysForecastDate3(widget.city.dateTimeDay3!);
    _homeController.fomartFiveDaysForecastDate4(widget.city.dateTimeDay4!);
    _homeController.fomartFiveDaysForecastDate5(widget.city.dateTimeDay5!);
    _homeController.checkIfACityIsFavorited(widget.city.cityName!);
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
                          iconButtonPressed: () async{
                            await _homeController.checkIfACityIsFavorited(widget.city.cityName!);
                          }),
                    ),
                    HomeMainCard(
                        cityName: widget.city.cityName!,
                        dateTime: _homeController.mainDate,
                        temperature: widget.city.temperature!,
                        humidity: widget.city.humidity!,
                        windSpeed: widget.city.windSpeed!,
                        feelsLike: widget.city.feelsLike!,
                        unitSymbol: "C", //LIDAR COM ISSO
                        onPressed: () async {
                          await _homeController.favoriteButtonPressed(widget.city.cityName!, widget.city.countryName, widget.city.temperature);
                        },
                        isFavorited: _homeController.isFavorited,
                        ),
                    HomeForecastNextDaysCard(
                        dateTimeDay2: _homeController.fiveDaysForecastDate2,
                        temperatureDay2: widget.city.temperatureDay2!,
                        dateTimeDay3: _homeController.fiveDaysForecastDate3,
                        temperatureDay3: widget.city.temperatureDay3!,
                        dateTimeDay4: _homeController.fiveDaysForecastDate4,
                        temperatureDay4: widget.city.temperatureDay4!,
                        dateTimeDay5: _homeController.fiveDaysForecastDate5,
                        temperatureDay5: widget.city.temperatureDay5!,
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
