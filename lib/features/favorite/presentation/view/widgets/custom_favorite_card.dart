import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';

class CustomFavoriteCard extends StatelessWidget {
  final String cityName;
  final String countryName;
  final num temperature;
  final Function() onTap;
  const CustomFavoriteCard({
    Key? key,
    required this.cityName,
    required this.countryName,
    required this.temperature,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: InkWell(
        child: GlassMorphism(
          child: SizedBox(
            height: 100,
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
