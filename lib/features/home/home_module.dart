import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/data/data_sources/api_call_data_source.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/favorite_page.dart';
import 'package:weather_app/features/home/presentation/view/controller/home_page_controller.dart';
import 'package:weather_app/features/home/presentation/view/home_page.dart';

class HomeModule extends Module {
  
  @override
  List<Bind> get binds => [
    Bind<HomePageController>((i) => HomePageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context,args) =>  HomePage())
      ];
}