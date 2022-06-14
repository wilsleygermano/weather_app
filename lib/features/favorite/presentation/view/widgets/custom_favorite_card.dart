import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';

class CustomFavoriteCard extends StatelessWidget {
  final String cityName;
  final String countryName;
  final int temperature;
  final void Function() onTap;

  final String unitSymbol;
  const CustomFavoriteCard({
    Key? key,
    required this.cityName,
    required this.onTap,
    required this.countryName,
    required this.temperature,
    required this.unitSymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: InkWell(
        child: GlassMorphism(
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
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
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                          ),
                          Text(
                            unitSymbol,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          start: 0.3,
          end: 0.1,
          borderRadius: 26,
        ),
        onTap: onTap,
      ),
    );
  }
}
