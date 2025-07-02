import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/anime.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  /// Ajouter un anime en favori
  Future<void> addFavorite(Anime anime) async {
    await client.from('favoris').insert({
      'mal_id': anime.malId,
      'title': anime.title,
      'image_url': anime.imageUrl,
      'episodes': anime.episodes,
      'genres': anime.genres,
      'synopsis': anime.synopsis,
    });
  }

  /// Supprimer un favori par mal_id
  Future<void> removeFavorite(int malId) async {
    await client
        .from('favoris')
        .delete()
        .eq('mal_id', malId);
  }

  /// Récupérer tous les favoris
  Future<List<Anime>> getFavorites() async {
    final response = await client
        .from('favoris')
        .select();

    return (response as List)
        .map((data) => Anime.fromJson(data as Map<String, dynamic>))
        .toList();
  }

  /// Vérifier si un anime est déjà en favori
  Future<bool> isFavorite(int malId) async {
    final response = await client
        .from('favoris')
        .select('mal_id')
        .eq('mal_id', malId)
        .limit(1);

    return response.isNotEmpty;
  }
}
