import 'package:flutter/material.dart';
import '../models/anime.dart';
import 'package:kioku/Services/supabase_service.dart';

class AnimeDetailPage extends StatefulWidget {
  final Anime anime;

  const AnimeDetailPage({Key? key, required this.anime}) : super(key: key);

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  final SupabaseService _supabaseService = SupabaseService();
  bool _isFavorite = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final isFav = await _supabaseService.isFavorite(widget.anime.malId);
    setState(() {
      _isFavorite = isFav;
      _loading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    setState(() => _loading = true);
    if (_isFavorite) {
      await _supabaseService.removeFavorite(widget.anime.malId);
    } else {
      await _supabaseService.addFavorite(widget.anime);
    }
    await _checkIfFavorite();
  }

  @override
  Widget build(BuildContext context) {
    final anime = widget.anime;

    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        actions: [
        IconButton(
          icon: Icon(
            _isFavorite ? Icons.star : Icons.star_border,
            color: _isFavorite ? Colors.amber : Colors.grey[400],
          ),
          onPressed: _toggleFavorite,
        ),
      ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image principale
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      anime.imageUrl,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox(
                        height: 220,
                        child: Center(child: Icon(Icons.broken_image, size: 48)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Titre
                  Text(
                    anime.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Infos : épisodes + genres
                  Row(
                    children: [
                      Text('${anime.episodes} épisodes',
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 16),
                      if (anime.genres.isNotEmpty)
                        Text(
                          anime.genres.take(3).join(', '),
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Synopsis
                  const Text(
                    'Synopsis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    anime.synopsis.isNotEmpty
                        ? anime.synopsis
                        : 'Synopsis indisponible.',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
    );
  }
}
