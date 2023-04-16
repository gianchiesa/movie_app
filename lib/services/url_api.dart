class Urls {
  static const String baseUrl = 'api.themoviedb.org/3';
  static const String imgUrl = 'https://image.tmdb.org/t/p/original';
  static const String apiKey = '59f583eafafc993371713ae20a84d390';
  // static const String baseUrl = 'http://10.0.2.2:5000/api';

  // Popular Movie
  static const String popular = '/movie/popular';

  // Pond
  static const String ponds = '$baseUrl/ponds';
  static String pond(String? pondId) => '$baseUrl/ponds/$pondId';
}
