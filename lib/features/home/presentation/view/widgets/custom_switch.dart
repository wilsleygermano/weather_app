import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<HomePageController>();
    bool isSwitched = false;
    return Observer(
      builder: (context) {
        return Switch(
                value: isSwitched,
                onChanged: (value) {
                  _controller.changeIsSwitched(value);
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              );
      }
    );
  }
}