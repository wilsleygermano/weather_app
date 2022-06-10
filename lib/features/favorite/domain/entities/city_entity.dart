class CityEntity {
  num? temperature;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? humidity;
  num? windSpeed;
  String? dateTime;
  String? cityName;
  String? countryName;

  num? temperatureDay2;
  String? dateTimeDay2;

  num? temperatureDay3;
  String? dateTimeDay3;

  num? temperatureDay4;
  String? dateTimeDay4;

  num? temperatureDay5;
  String? dateTimeDay5;

  CityEntity({this.temperature, this.cityName, this.countryName});

  CityEntity.fromApi(Map<String, dynamic> json) {
    temperature = json['list'][0]['main']['temp'];
    feelsLike = json['list'][0]['main']['feels_like'];
    tempMin = json['list'][0]['main']['temp_min'];
    tempMax = json['list'][0]['main']['temp_max'];
    humidity = json['list'][0]['main']['humidity'];
    windSpeed = json['list'][0]['wind']['speed'];
    dateTime = json['list'][0]['dt_txt'];
    cityName = json['city']['name'];
    countryName = json['city']['country'];

    temperatureDay2 = json['list'][8]['main']['temp'];
    dateTimeDay2 = json['list'][8]['dt_txt'];

    temperatureDay3 = json['list'][16]['main']['temp'];
    dateTimeDay3 = json['list'][16]['dt_txt'];

    temperatureDay4 = json['list'][24]['main']['temp'];
    dateTimeDay4 = json['list'][24]['dt_txt'];

    temperatureDay5 = json['list'][32]['main']['temp'];
    dateTimeDay5 = json['list'][32]['dt_txt'];
  }

  CityEntity.fromFirestore(Map<String, dynamic> map) {
    cityName = map['city_name'];
    countryName = map['country_name'];
    temperature = num.parse(map['temperature']);
  }
}
