import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/home/presentation/view/widgets/custom_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<FavoritePageController>();
  // Text(_controller.temperature.toString()),
  // Text( _controller.feelsLike.toString()),
  // Text(_controller.tempMin.toString()),
  // Text(_controller.tempMax.toString()),
  // Text(_controller.humidity.toString()),
  // Text(_controller.windSpeed.toString()),
  // Text(_controller.dateTime),
  // Text(_controller.cityName),
  // Text(_controller.countryName),
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
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: GlassMorphism(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Text(
                              //   'toggle',
                              //   style: Theme.of(context).textTheme.headline6,
                              // ),
                              const CustomSwitch(),
                              const Spacer(),
                              Text(
                                _controller.cityName,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _controller.dateTime,
                                style: Theme.of(context).textTheme.headline2,
                              )
                            ],
                          ),
                          const SizedBox(height: 42),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _controller.temperature.toString() + 'º',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 42),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Humidity:',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    _controller.humidity.toString() + '%',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Wind speed:',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    _controller.windSpeed.toString() + 'km/h',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Feels like:',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    _controller.feelsLike.toString() + 'º',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    start: 0.3,
                    end: 0.1,
                    borderRadius: 20),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 48, 16, 32),
                child: GlassMorphism(
                    child: SizedBox(
                      height: 110,
                      width: 320,
                    ),
                    start: 0.3,
                    end: 0.1,
                    borderRadius: 10),
              )
            ],
          );
        }));
  }
}
