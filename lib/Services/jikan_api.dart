import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime.dart';

class JikanApi {
  static const String baseUrl = 'https://api.jikan.moe/v4';

  /// Récupère les animes populaires (renommée pour cohérence avec les filtres)
  static Future<List<Anime>> getMostPopularAnime() async {
    final response = await http.get(Uri.parse('$baseUrl/top/anime?limit=20&filter=bypopularity'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des animes populaires');
    }
  }

  /// Recherche d’animes par titre
  static Future<List<Anime>> searchAnime(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/anime?q=$query&limit=20'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } else {
      throw Exception('Erreur lors de la recherche');
    }
  }

  /// Récupère les animes en cours de diffusion
  static Future<List<Anime>> getAiringAnime() async {
    final response = await http.get(Uri.parse('$baseUrl/top/anime?filter=airing&limit=20'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des animes en cours');
    }
  }

  /// Récupère les animes à venir
  static Future<List<Anime>> getUpcomingAnime() async {
    final response = await http.get(Uri.parse('$baseUrl/top/anime?filter=upcoming&limit=20'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des animes à venir');
    }
  }

  /// Récupère les animes les mieux notés
  static Future<List<Anime>> getTopAnime() async {
    final response = await http.get(Uri.parse('$baseUrl/top/anime?limit=20&filter=favorite'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des animes top note');
    }
  }

  /// Récupère les détails d'un anime par son ID
  static Future<Anime> fetchAnimeDetails(int malId) async {
  final response = await http.get(Uri.parse('$baseUrl/anime/$malId'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final animeData = jsonData['data'];
    return Anime.fromJson(animeData);
  } else {
    throw Exception('Erreur lors de la récupération des détails de l’anime');
  }
}

}
