import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

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
    return Observer(builder: (context) {
      return Scaffold(
        body: Column(
          children: [
            Text(_controller.temperature.toString()),
            Text( _controller.feelsLike.toString()),
            Text(_controller.tempMin.toString()),
            Text(_controller.tempMax.toString()),
            Text(_controller.humidity.toString()),
            Text(_controller.windSpeed.toString()),
            Text(_controller.dateTime),
            Text(_controller.cityName),
            Text(_controller.countryName),
          ],
        )
      );
    });
  }
}
