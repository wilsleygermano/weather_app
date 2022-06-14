import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  final _controller = Modular.get<FavoritePageController>();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => DropdownButtonHideUnderline(
        child: DropdownButton2(
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
          onChanged: (value) async {
            // }
            if (value == MenuItems.celsius) {
              await _controller.caseCelsius();
            }
            if (value == MenuItems.fahrenheit) {
              await _controller.caseFahrenheit();
            }
              if (value == MenuItems.signOut) {
              await FirebaseAuth.instance.signOut();
              await Modular.to.pushReplacementNamed("/");
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
        ),
      ),
    );
  }
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
  static const List<MenuItem> firstItems = [celsius, fahrenheit, signOut];

  static const celsius =
      MenuItem(text: 'Celsius', iconFa: FontAwesomeIcons.temperatureLow);
  static const fahrenheit =
      MenuItem(text: 'Fahrenheit', iconFa: FontAwesomeIcons.temperatureHigh);
  static const signOut = MenuItem(text: 'SignOut', iconFa: FontAwesomeIcons.arrowRightFromBracket);


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
