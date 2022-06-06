import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/features/favorite/data/data_sources/api_call_data_source.dart';
part 'favorite_page_controller.g.dart';

class FavoritePageController = _FavoritePageControllerBase with _$FavoritePageController;

abstract class _FavoritePageControllerBase with Store {
  @observable
  String city = '';

  @action
  void storeCityTyped(String newValue) => city = newValue;

  // @action
  // Future searchWordTyped(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => FetchApi(),
  //     ),
  //   );
  // }
}