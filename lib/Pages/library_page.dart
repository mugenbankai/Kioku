import 'package:flutter/material.dart';
import '../components/anime_card.dart';
import '../models/anime.dart';
import 'package:kioku/Services/supabase_service.dart';
import 'anime_detail_page.dart';
import 'package:kioku/app.dart'; // <- Pour le routeObserver

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> with RouteAware {
  final SupabaseService _supabaseService = SupabaseService();
  List<Anime> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  final route = ModalRoute.of(context);
  if (route is PageRoute) {
    routeObserver.subscribe(this, route);
  }
}


  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // 🔁 Appelé quand on revient sur cette page
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);
    try {
      final animes = await _supabaseService.getFavorites();
      setState(() => _favorites = animes);
    } catch (e) {
      print('Erreur chargement favoris : $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _removeFromFavorites(Anime anime) async {
    await _supabaseService.removeFavorite(anime.malId);
    setState(() => _favorites.removeWhere((a) => a.malId == anime.malId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bibliothèque',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _favorites.isEmpty
                      ? const Center(
                          child: Text(
                            'Aucun anime ajouté.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : GridView.builder(
                          itemCount: _favorites.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final anime = _favorites[index];
                            return AnimeCard(
                              title: anime.title,
                              imageUrl: anime.imageUrl,
                              episodeCount: anime.episodes,
                              genres: anime.genres,
                              isFavorite: true,
                              onStarTap: () => _removeFromFavorites(anime),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AnimeDetailPage(anime: anime),
                                  ),
                                );
                              },
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
