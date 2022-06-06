import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';

class AppModule extends Module {
  
  @override
  List<Bind> get binds => [
    Bind<FavoritePageController>((i) => FavoritePageController())
  ];

  //  @override
  // List<ModularRoute> get routes => [
  //       ModuleRoute(
  //         Modular.initialRoute,
  //         module: favo(),
  //       ),
  //       ModuleRoute(
  //         '/register/',
  //         module: RegisterModule(),
  //       ),
  //       ModuleRoute(
  //         '/onboarding/',
  //         module: OnboardingModule(),
  //       ),
  //     ];

}