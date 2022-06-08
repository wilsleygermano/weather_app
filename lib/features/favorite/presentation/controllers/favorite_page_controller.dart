import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_call_use_case.dart';
part 'favorite_page_controller.g.dart';

class FavoritePageController = _FavoritePageControllerBase
    with _$FavoritePageController;

abstract class _FavoritePageControllerBase with Store {
  final _useCase = Modular.get<ApiCallUseCase>();
  final _repository = Modular.get<ApiCallRepository>();

  @observable
  String city = '';

  @action
  void storeCityTyped(String newValue) => city = newValue;

  @observable
  String cityName = 'Pesquise um local';

  @observable
  String countryName = '...';

  @observable
  num temperature = 0;

  @action
  Future<Resource<void, ApiCallError>> returnCityValues(String city) async {
    final resource = await _useCase.returnCityValues(city);
    final cityModel = await _repository.returnCityValues(city);
    if (resource.hasError) {
      return Resource.failed(error: ApiCallError.apiError);
    }
    cityName = cityModel.data!.cityName!;
    countryName = cityModel.data!.countryName!;
    temperature = cityModel.data!.temperature!;
    return Resource.success();
  }
}
