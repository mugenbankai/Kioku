import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int episodeCount;
  final List<String> genres;
  final bool isFavorite;
  final VoidCallback onStarTap;
  final VoidCallback onTap; // <-- ajout ici

  const AnimeCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.episodeCount,
    required this.genres,
    required this.isFavorite,
    required this.onStarTap,
    required this.onTap, // <-- ajout ici
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // <-- rend la carte cliquable
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Contenu principal
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image de l’anime
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(
                      height: 140,
                      child: Center(child: Icon(Icons.broken_image, color: Colors.grey)),
                    ),
                  ),
                ),

                // Infos texte
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$episodeCount épisodes',
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      ),
                      if (genres.isNotEmpty)
                        Text(
                          genres.take(2).join(', '),
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // ⭐ Bouton étoile en haut à droite
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  onStarTap();
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? Colors.amber : Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
