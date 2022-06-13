import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class DropdownMenu extends StatelessWidget {
  const DropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<FavoritePageController>();
    return DropdownButtonHideUnderline(
      child: Observer(builder: (context) {
        return DropdownButton2(
          customButton: const Icon(
            FontAwesomeIcons.ellipsis,
            size: 25,
            color: MyColors.primarypurple,
          ),
          customItemsIndexes: const [3],
          customItemsHeight: 16,
          items: [
            ...MenuItems.firstItems.map(
              (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),
          ],
          onChanged: (value) {
            // MenuItems.onChanged(context, value as MenuItem);
            // if(MenuItems.celsius){

            // }
            switch (value) {
              case MenuItems.celsius:
                _controller.caseCelsius();
                break;
              case MenuItems.fahrenheit:
              _controller.caseFahrenheit();
              break;
            }
          },
          itemHeight: 36,
          dropdownWidth: 140,
          dropdownDecoration: BoxDecoration(
            color: MyColors.primarypurple.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          dropdownElevation: 8,
          offset: const Offset(0, 8),
        );
      }),
    );
  }

  // Future<void> caseCelsius() async {
  //   final _controller = Modular.get<FavoritePageController>();
  //   await _controller.changeTemperatureUnitToMetric();
  //   await _controller.changeUnitSymbolToMetric();
  //   await _controller.getFavoriteCities();
  //   await _controller.fetchSearchedCity();
  // }
}

class MenuItem {
  final String text;
  final IconData? iconFa;

  const MenuItem({
    required this.text,
    this.iconFa,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [celsius, fahrenheit, edit];

  static const celsius =
      MenuItem(text: 'Celsius', iconFa: FontAwesomeIcons.temperatureLow);
  static const fahrenheit =
      MenuItem(text: 'Fahrenheit', iconFa: FontAwesomeIcons.temperatureHigh);
  static const edit = MenuItem(text: 'Edit', iconFa: FontAwesomeIcons.pen);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.iconFa, color: Colors.white, size: 14),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: TextStyle(
            color: MyColors.primarywhite,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
        ),
      ],
    );
  }
}
