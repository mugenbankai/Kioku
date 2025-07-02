import 'package:flutter/material.dart';
import '../components/anime_card.dart';
import '../models/anime.dart' ;
import 'package:kioku/services/jikan_api.dart';
import 'package:kioku/Services/supabase_service.dart';
import 'anime_detail_page.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final SupabaseService _supabaseService = SupabaseService();

  List<Anime> _results = [];
  Set<int> _favoriteIds = {};
  bool _isLoading = false;
  String _selectedFilter = 'Populaires';

  final List<String> filters = ['Populaires', 'En cours', 'À venir', 'Top Note'];

  @override
  void initState() {
    super.initState();
    _fetchByFilter(); // initial (populaire)
  }

  @override
  bool get wantKeepAlive => true;

  void _fetchByFilter() async {
    if (_controller.text.isNotEmpty) return; // ne pas filtrer si recherche active

    setState(() => _isLoading = true);

    try {
      List<Anime> animes = [];

      switch (_selectedFilter) {
        case 'En cours':
          animes = await JikanApi.getAiringAnime();
          break;
        case 'À venir':
          animes = await JikanApi.getUpcomingAnime();
          break;
        case 'Top Note':
          animes = await JikanApi.getTopAnime();
          break;
        default:
          animes = await JikanApi.getMostPopularAnime();
      }

      final favs = await _supabaseService.getFavorites();
      final favIds = favs.map((e) => e.malId).toSet();

      setState(() {
        _results = animes;
        _favoriteIds = favIds;
      });
    } catch (e) {
      print('Erreur filtre : $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _searchAnime(String query) async {
    if (query.isEmpty) {
      _fetchByFilter();
      return;
    }

    setState(() => _isLoading = true);

    try {
      final animes = await JikanApi.searchAnime(query);
      final favs = await _supabaseService.getFavorites();
      final favIds = favs.map((e) => e.malId).toSet();

      setState(() {
        _results = animes;
        _favoriteIds = favIds;
      });
    } catch (e) {
      print('Erreur recherche : $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _toggleFavorite(Anime anime) async {
  final isFav = _favoriteIds.contains(anime.malId);

  if (isFav) {
    await _supabaseService.removeFavorite(anime.malId);
    setState(() => _favoriteIds.remove(anime.malId));
  } else {
    await _supabaseService.addFavorite(anime);
    final newFavs = await _supabaseService.getFavorites();
    print('Favoris actuels: ${newFavs.map((e) => e.title).toList()}');
    setState(() => _favoriteIds.add(anime.malId));
  }
}



  void _onFilterChange(String selected) {
    setState(() => _selectedFilter = selected);
    if (_controller.text.isEmpty) {
      _fetchByFilter(); // Ne filtre que si pas de texte dans la recherche
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // important pour AutomaticKeepAliveClientMixin

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Recherche / Explorer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Champ de recherche
            TextField(
              controller: _controller,
              onSubmitted: _searchAnime,
              decoration: InputDecoration(
                hintText: 'Rechercher un anime...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    _fetchByFilter(); // recharge selon filtre
                  },
                ),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Filtres horizontaux
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isActive = _selectedFilter == filter;

                  return ChoiceChip(
                    label: Text(filter),
                    selected: isActive,
                    onSelected: (_) => _onFilterChange(filter),
                    selectedColor: Colors.teal,
                    backgroundColor: Colors.grey[800],
                    labelStyle: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[400],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Résultats
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _results.isEmpty
                      ? const Center(
                          child: Text(
                            'Aucun résultat.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : GridView.builder(
                          itemCount: _results.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final anime = _results[index];
                            final isFav = _favoriteIds.contains(anime.malId);

                            return AnimeCard(
                              title: anime.title,
                              imageUrl: anime.imageUrl,
                              episodeCount: anime.episodes,
                              genres: anime.genres,
                              isFavorite: isFav,
                              onStarTap: () => _toggleFavorite(anime),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnimeDetailPage(anime: anime),
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
