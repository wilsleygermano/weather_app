import 'package:flutter/material.dart';
import 'package:weather_app/core/design/my_colors.dart';

class HighLowField extends StatelessWidget {
  final int dayHighAndLow;
  final IconData icon;

  const HighLowField({
    Key? key,
    required this.dayHighAndLow,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$dayHighAndLow",
          style: Theme.of(context).textTheme.headline3,
        ),
         Text(
          "º",
          style: Theme.of(context).textTheme.headline3,
        ),
        Icon(
          icon,
          color: MyColors.primarywhite,
          size: 14,
        )
      ],
    );
  }
}
