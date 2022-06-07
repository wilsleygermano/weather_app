import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/favorite_module.dart';
import 'package:weather_app/features/home/home_module.dart';

class AppModule extends Module {
  
  // @override
  // List<Bind> get binds => [
  //   Bind<FavoritePageController>((i) => FavoritePageController()),
  //   Bind<ApiCallRepository>((i) => FetchApi()),
  // ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: FavoriteModule(),
        ),
        ModuleRoute(
          '/home/',
          module: HomeModule(),
        ),
        // ModuleRoute(
        //   '/onboarding/',
        //   module: OnboardingModule(),
        // ),
      ];
}