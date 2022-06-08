import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/data/data_sources/api_call_data_source.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_acess_use_case.dart';
import 'package:weather_app/features/favorite/presentation/controllers/favorite_page_controller.dart';
import 'package:weather_app/features/favorite/presentation/view/favorite_page.dart';

class FavoriteModule extends Module {
  
  @override
  List<Bind> get binds => [
    Bind<FavoritePageController>((i) => FavoritePageController()),
    Bind<ApiAcessUseCase>(
            (i) => DefaultApiAcessUseCase()),
    Bind<ApiCallRepository>((i) => DefaultApiCall()),
    Bind<AcessRemoteDataSource>((i) => ApiAcessRemoteDataSource()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context,args) =>  FavoritePage())
      ];
}