import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<FavoritePageController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 80, 110, 30),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 40,
            decoration: MyColors.gradientCard,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: TextField(
                style: Theme.of(context).textTheme.headline4,
                cursorColor: MyColors.primarywhite,
                onChanged: _controller.storeCityTyped,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _controller.returnCityValues(_controller.city);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: MyColors.primarywhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
