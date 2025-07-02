class Anime {
  final int malId;
  final String title;
  final String imageUrl;
  final int episodes;
  final List<String> genres;
  final String synopsis;

  Anime({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.episodes,
    required this.genres,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    final dynamic rawGenres = json['genres'];

    List<String> parsedGenres = [];
    if (rawGenres is List) {
      parsedGenres = rawGenres.map((e) {
        if (e is String) return e;
        if (e is Map && e.containsKey('name')) return e['name'].toString();
        return '';
      }).where((name) => name.isNotEmpty).toList();
    }

    return Anime(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'] ??
          json['images']?['jpg']?['image_url'] ??
          '',
      episodes: json['episodes'] ?? 0,
      genres: parsedGenres,
      synopsis: json['synopsis'] ?? 'Aucun synopsis disponible.',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mal_id': malId,
      'title': title,
      'image_url': imageUrl,
      'episodes': episodes,
      'genres': genres,
      'synopsis': synopsis,
    };
  }
}
