import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/design/my_colors.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class CustomFavoriteCard extends StatelessWidget {
  final String cityName;
  final String countryName;
  final double temperature;
  const CustomFavoriteCard(
      {Key? key,
      required this.cityName,
      required this.countryName,
      required this.temperature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              height: 100,
              decoration: MyColors.gradientCard,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(cityName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(countryName,
                                style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                temperature.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
