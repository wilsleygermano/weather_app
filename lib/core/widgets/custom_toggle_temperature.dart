import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class CustomToggleTemperature extends StatelessWidget {
  final double minWidth;
  final double minHeight;
  const CustomToggleTemperature({Key? key,
  required this.minWidth,
  required this.minHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<FavoritePageController>();
    return Observer(
      builder: (context) {
        return ToggleSwitch(
          borderColor: const [
            MyColors.primarywhite,
          ],
          borderWidth: 1,
          minWidth: minWidth,
          minHeight: minHeight,
          cornerRadius: 20.0,
          activeBgColor: const [MyColors.primarypurple],
          activeFgColor: MyColors.primarywhite,
          inactiveBgColor: const Color(0XFFC2AFEC),
          inactiveFgColor: MyColors.primarywhite,
          initialLabelIndex: _controller.initialLabelIndex,
          totalSwitches: 2,
          labels: const ['ºC', 'ºF'],
          radiusStyle: true,
          onToggle: (index) async {
            if (index == 0) {
              _controller.changeTemperatureUnitToMetric();
              await _controller.returnCityValues(_controller.city);
              _controller.changeUnitSymbolToMetric();
            }
            if (index == 1) {
              _controller.changeTemperatureUnitToImperial();
              await _controller.returnCityValues(_controller.city);
              _controller.changeUnitSymbolToImperial();
            }
          },
        );
      }
    );
  }
}
