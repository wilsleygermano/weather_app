import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/design/my_colors.dart';

// class DropdownMenu extends StatefulWidget {
//   final Function() changeToCelsius;
//   const DropdownMenu({Key? key,
//   required this.changeToCelsius,
//   }) : super(key: key);

//   @override
//   State<DropdownMenu> createState() => _DropdownMenuState();
// }

// class _DropdownMenuState extends State<DropdownMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         customButton: const Icon(
//           FontAwesomeIcons.ellipsis,
//           size: 25,
//           color: MyColors.primarypurple,
//         ),
//         customItemsIndexes: const [3],
//         customItemsHeight: 16,
//         items: [
//           ...MenuItems.firstItems.map(
//             (item) => DropdownMenuItem<MenuItem>(
//               value: item,
//               child: MenuItems.buildItem(item),
//             ),
//           ),
//         ],
//         onChanged: (value) {
//           MenuItems.onChanged(context, value as MenuItem);
//         },
//         itemHeight: 36,
//         // itemPadding: const EdgeInsets.only(left: 8, right: 8),
//         dropdownWidth: 140,
//         dropdownDecoration: BoxDecoration(
//           color: MyColors.primarypurple.withOpacity(0.3),
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           border: Border.all(
//             width: 1.5,
//             color: Colors.white.withOpacity(0.6),
//           ),
//         ),
//         dropdownElevation: 8,
//         offset: const Offset(0, 8),
//       ),
//     );
//   }
// }

// class MenuItem {
//   final String text;
//   final IconData? iconFa;

//   const MenuItem({
//     required this.text,
//     this.iconFa,
//   });
// }

// class MenuItems {
//   static const List<MenuItem> firstItems = [celsius, fahrenheit, edit];

//   static const celsius =
//       MenuItem(text: 'Celsius', iconFa: FontAwesomeIcons.temperatureLow);
//   static const fahrenheit =
//       MenuItem(text: 'Fahrenheit', iconFa: FontAwesomeIcons.temperatureHigh);
//   static const edit = MenuItem(text: 'Edit', iconFa: FontAwesomeIcons.pen);

//   static Widget buildItem(MenuItem item) {
//     return Row(
//       children: [
//         Icon(item.iconFa, color: Colors.white, size: 14),
//         const SizedBox(
//           width: 10,
//         ),
//         Text(
//           item.text,
//           style: TextStyle(
//             color: MyColors.primarywhite,
//             fontWeight: FontWeight.normal,
//             fontSize: 14,
//             fontFamily: GoogleFonts.lato().fontFamily,
//           ),
//         ),
//       ],
//     );
//   }

//   static onChanged(BuildContext context, MenuItem item) {
//     switch (item) {
//       case MenuItems.celsius:

//         break;
//       case MenuItems.fahrenheit:
//         //Do something
//         break;
//       case MenuItems.edit:
//         //Do something
//         break;
//     }
//   }
// }

class DropdownMenu extends StatelessWidget {
  final Function() changeToCelsius;
  const DropdownMenu({
    Key? key,
    required this.changeToCelsius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
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
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 36,
        // itemPadding: const EdgeInsets.only(left: 8, right: 8),
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

  static onChanged(BuildContext context, MenuItem item) {
    Function()? ChangeToCelsius;
    switch (item) {
      case MenuItems.celsius:
      ChangeToCelsius;
        break;
      case MenuItems.fahrenheit:
        //Do something
        break;
      case MenuItems.edit:
        //Do something
        break;
    }
  }
}
