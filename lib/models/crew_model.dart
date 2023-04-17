class CrewMovie {
  num? id;
  String? name;

  CrewMovie({
    required this.id,
    required this.name,
  });

  factory CrewMovie.fromJson(Map<String, dynamic> json) {
    return CrewMovie(
      id: json['id'],
      name: json['name'],
    );
  }
  static List<CrewMovie> fromJsonList(List<dynamic> list) {
    List<CrewMovie> crews = [];
    for (var item in list) {
      crews.add(CrewMovie.fromJson(item));
    }
    return crews;
  }
}
