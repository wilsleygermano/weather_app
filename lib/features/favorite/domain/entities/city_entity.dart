class CityEntity {
  double? temperature;
  // double? feelsLike;
  // int? humidity;
  // double? windSpeed;
  // String? dateTime;
  // String? cityName;
  // String? countryName;

  // CityEntity({this.temperature, this.feelsLike, this.humidity, this.windSpeed, this.dateTime, this.cityName, this.countryName});
  CityEntity({this.temperature});

  CityEntity.fromJson(Map<String, dynamic> json) {
    temperature = json['list'][0]['main']['temp'];
    // feelsLike = json['list']['main']['feels_like'];
    // humidity = json['list']['main']['humidity'];
    // windSpeed = json['list']['wind']['speed'];
    // dateTime = json['list']['dt_txt'];
    // cityName = json['city']['name'];
    // countryName = json['city']['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['list'][0]['main']['temp'] = temperature;
    // data['feelsLike'] = feelsLike;
    // data['humidity'] = humidity;
    // data['windSpeed'] = windSpeed;
    // data['dateTime'] = dateTime;
    // data['cityName'] = cityName;
    // data['countryName'] = countryName;
    return data;
  }
}