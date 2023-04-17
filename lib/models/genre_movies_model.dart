class GenreMovie {
  num? id;
  String? name;

  GenreMovie({
    required this.id,
    required this.name,
  });

  factory GenreMovie.fromJson(Map<String, dynamic> json) {
    return GenreMovie(
      id: json['id'],
      name: json['name'],
    );
  }
  static List<GenreMovie> fromJsonList(List<dynamic> list) {
    List<GenreMovie> genres = [];
    for (var item in list) {
      genres.add(GenreMovie.fromJson(item));
    }
    return genres;
  }
}
