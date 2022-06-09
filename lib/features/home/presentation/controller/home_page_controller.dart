import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  String mainDate = " ";

  @observable
  String fiveDaysForecastDate = " ";

  @action
  fomartMainDate(String dateTime) {
    return mainDate = DateFormat('EEEE, d').format(DateTime.parse(dateTime));
  }

  @action
  fomartFiveDaysForecastDate(String dateTime) {
    return fiveDaysForecastDate = DateFormat('E, d').format(DateTime.parse(dateTime));
  }
}
