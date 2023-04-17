class CastMovie {
  num? id;
  String? name;

  CastMovie({
    required this.id,
    required this.name,
  });

  factory CastMovie.fromJson(Map<String, dynamic> json) {
    return CastMovie(
      id: json['id'],
      name: json['name'],
    );
  }
  static List<CastMovie> fromJsonList(List<dynamic> list) {
    List<CastMovie> casts = [];
    for (var item in list) {
      casts.add(CastMovie.fromJson(item));
    }
    return casts;
  }
}
