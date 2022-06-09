import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/adapters/remote_client.dart';
import 'package:weather_app/features/favorite/favorite_module.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RemoteClient>(
          (i) => DioRemoteClient(),
        ),
        Bind<FavoritePageController>((i) => FavoritePageController(),),
      ];

  @override
  List<ModularRoute> get routes => [
        // ModuleRoute(
        //   Modular.initialRoute,
        //   module: LoginModule(),
        // ),
        // ModuleRoute(
        //   '/register/',
        //   module: RegisterModule(),
        // ),
          ModuleRoute(
          // '/favorites/',
          Modular.initialRoute,
          module: FavoriteModule(),
        ),
        ModuleRoute(
          '/home/',
          module: HomeModule(),
        ),
      ];
}
