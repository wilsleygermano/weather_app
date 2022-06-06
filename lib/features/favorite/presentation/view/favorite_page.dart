import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/widgets/custom_search_bar.dart';
import 'package:weather_app/features/favorite/data/data_sources/api_call_data_source.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({ Key? key }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = Modular.get<FavoritePageController>();
  final _dataSource = Modular.get<FetchApi>();
  FetchApi cityResult = FetchApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              CustomSearchBar(onChanged: _controller.searchCity),
              ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                          return Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _controller.city
                              ),
                            ),
                          );
                        },
              )
            ],
          );
        }
      ),
    );
  }
}