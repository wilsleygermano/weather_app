import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  String mainDate = " ";

  @observable
  String fiveDaysForecastDate2 = " ";

  @observable
  String fiveDaysForecastDate3 = " ";

  @observable
  String fiveDaysForecastDate4 = " ";

  @observable
  String fiveDaysForecastDate5 = " ";

  @action
  fomartMainDate(String dateTime) {
    return mainDate = DateFormat('EEEE, d').format(DateTime.parse(dateTime));
  }

  @action
  fomartFiveDaysForecastDate2(String dateTime) {
      return fiveDaysForecastDate2 =
          DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @action
  fomartFiveDaysForecastDate3(String dateTime) {
      return fiveDaysForecastDate3 =
          DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @action
  fomartFiveDaysForecastDate4(String dateTime) {
      return fiveDaysForecastDate4 =
          DateFormat('E, d').format(DateTime.parse(dateTime));
  }

  @action
  fomartFiveDaysForecastDate5(String dateTime) {
      return fiveDaysForecastDate5 =
          DateFormat('E, d').format(DateTime.parse(dateTime));
  }
}
