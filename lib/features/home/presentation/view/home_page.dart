import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class HomePage extends StatefulWidget {
  final String city;
  final double temperature;
  const HomePage({ Key? key,
  required this.city,
  required this.temperature
   }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<FavoritePageController>();
@override
  void initState() {
    _controller.returnCityValues(widget.city);
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.temperature.toString()),);
  }
}