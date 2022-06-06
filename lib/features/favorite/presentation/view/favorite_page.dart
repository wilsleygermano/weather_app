import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/custom_search_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({ Key? key }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomSearchBar(onChanged: _controller.),
      ),
    );
  }
}