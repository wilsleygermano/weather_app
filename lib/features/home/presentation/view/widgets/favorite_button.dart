import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/core/design/my_colors.dart';

class FavoriteButton extends StatelessWidget {
  final Function() onPressed;
  final bool isFavorited;
  const FavoriteButton({
    Key? key,
    required this.onPressed,
    required this.isFavorited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: onPressed,
      icon: isFavorited
          ? const Icon(
              Icons.star,
              color: MyColors.primarypurple,
            )
          : const Icon(
              Icons.star_outline,
              color: MyColors.primarypurple,
            ),
    );
  }
}
