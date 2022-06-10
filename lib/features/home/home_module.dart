import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/favorite/data/data_sources/call_data_source.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_call_use_case.dart';
import 'package:weather_app/features/home/presentation/controller/home_page_controller.dart';
import 'package:weather_app/features/home/presentation/view/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ApiCallUseCase>((i) => DefaultApiCallUseCase()),
        Bind<ApiCallRepository>((i) => DefaultApiCall()),
        Bind<CallRemoteDataSource>((i) => ApiCallRemoteDataSource()),
        Bind<HomePageController>((i) => HomePageController()),

      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute(Modular.initialRoute, child: (context, args) =>  HomePage(city: args.data))];
}
