import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/home/presentation/view/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<FavoritePageController>((i) => FavoritePageController(),),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute(Modular.initialRoute, child: (context, args) => const HomePage())];
}
