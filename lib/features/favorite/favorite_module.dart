import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/data/data_sources/call_data_source.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_call_use_case.dart';
import 'package:weather_app/features/favorite/presentation/view/favorite_page.dart';

class FavoriteModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ApiCallUseCase>((i) => DefaultApiCallUseCase()),
        Bind<ApiCallRepository>((i) => DefaultApiCall()),
        Bind<CallRemoteDataSource>((i) => ApiCallRemoteDataSource()),

      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const FavoritePage())
      ];
}
