class CityEntity {
  num? temperature;
  // double? feelsLike;
  // int? humidity;
  // double? windSpeed;
  // String? dateTime;
  String? cityName;
  String? countryName;

  CityEntity({this.temperature, this.cityName, this.countryName});

  CityEntity.fromJson(Map<String, dynamic> json) {
    temperature = json['list'][0]['main']['temp'];
    // feelsLike = json['list']['main']['feels_like'];
    // humidity = json['list']['main']['humidity'];
    // windSpeed = json['list']['wind']['speed'];
    // dateTime = json['list']['dt_txt'];
    cityName = json['city']['name'];
    countryName = json['city']['country'];
  }
}
// class CityEntity {
//   double? temperature;


//   CityEntity(
//       {this.temperature});

//   factory CityEntity.fromMap(Map<String, dynamic> map) {
//     return CityEntity(
//         temperature: map['list'][0]['main']['temp']);
//   }

//   Map<String, dynamic> toMap(CityEntity entity) {
//     return {
//       "temperature": entity.temperature,
//     };
//   }
// }
