import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String url;

  const PokemonCard({super.key, required this.name, required this.url});

  int getIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return int.tryParse(segments[segments.length - 2]) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final id = getIdFromUrl(url);
    final imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50),
        title: Text(name.toUpperCase()),
      ),
    );
  }
}
