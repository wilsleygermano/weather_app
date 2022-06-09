// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$mainDateAtom =
      Atom(name: '_HomePageControllerBase.mainDate', context: context);

  @override
  String get mainDate {
    _$mainDateAtom.reportRead();
    return super.mainDate;
  }

  @override
  set mainDate(String value) {
    _$mainDateAtom.reportWrite(value, super.mainDate, () {
      super.mainDate = value;
    });
  }

  late final _$fiveDaysForecastDateAtom = Atom(
      name: '_HomePageControllerBase.fiveDaysForecastDate', context: context);

  @override
  String get fiveDaysForecastDate {
    _$fiveDaysForecastDateAtom.reportRead();
    return super.fiveDaysForecastDate;
  }

  @override
  set fiveDaysForecastDate(String value) {
    _$fiveDaysForecastDateAtom.reportWrite(value, super.fiveDaysForecastDate,
        () {
      super.fiveDaysForecastDate = value;
    });
  }

  late final _$_HomePageControllerBaseActionController =
      ActionController(name: '_HomePageControllerBase', context: context);

  @override
  dynamic fomartMainDate(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.fomartMainDate');
    try {
      return super.fomartMainDate(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fomartFiveDaysForecastDate(String dateTime) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.fomartFiveDaysForecastDate');
    try {
      return super.fomartFiveDaysForecastDate(dateTime);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mainDate: ${mainDate},
fiveDaysForecastDate: ${fiveDaysForecastDate}
    ''';
  }
}
