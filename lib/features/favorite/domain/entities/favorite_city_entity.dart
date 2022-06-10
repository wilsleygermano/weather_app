class FavoriteCityEntity {
  String? cityName;
  String? countryName;
  String? temperature;

  FavoriteCityEntity({
    this.cityName,
    this.countryName,
    this.temperature
  });

  factory FavoriteCityEntity.fromJson(Map<String, dynamic> json) {
    return FavoriteCityEntity(
      cityName: json['city_name'],
      countryName: json['country_name'],
      temperature: json['temperature'],
    );
  }
}