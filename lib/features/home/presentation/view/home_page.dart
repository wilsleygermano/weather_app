import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/features/home/presentation/view/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();

  getCity(){
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    _controller.returnCityValues(arguments['city']);
  }

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getCity(); });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Center(
          child: Text(_controller.temperature.toString()),
        );
      }
    );
  }
}
