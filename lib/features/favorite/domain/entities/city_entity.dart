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

  CityEntity({this.temperature, this.cityName, this.countryName});

  CityEntity.fromJson(Map<String, dynamic> json) {
    temperature = json['list'][0]['main']['temp'];
    feelsLike = json['list'][0]['main']['feels_like'];
    tempMin = json['list'][0]['main']['temp_min'];
    tempMax = json['list'][0]['main']['temp_max'];
    humidity = json['list'][0]['main']['humidity'];
    windSpeed = json['list'][0]['wind']['speed'];
    dateTime = json['list'][0]['dt_txt'];
    cityName = json['city']['name'];
    countryName = json['city']['country'];
  }
}
