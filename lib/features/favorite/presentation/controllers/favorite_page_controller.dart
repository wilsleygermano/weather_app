import 'package:mobx/mobx.dart';
part 'favorite_page_controller.g.dart';

class FavoritePageController = _FavoritePageControllerBase with _$FavoritePageController;

abstract class _FavoritePageControllerBase with Store {
  @observable
  String city = '';

  @action
  @action
  void searchCity(String newValue) => city = newValue;
}