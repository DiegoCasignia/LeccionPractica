import 'package:flutter/material.dart';
import '../../data/datasources/remote/pokemon_remote_data_source.dart';
import '../../data/models/pokemon_detail_model.dart';

class PokemonDetailPage extends StatefulWidget {
  final String url;

  const PokemonDetailPage({super.key, required this.url});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  PokemonDetailModel? detail;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadDetail();
  }

  Future<void> loadDetail() async {
    final dataSource = PokemonRemoteDataSource();
    final result = await dataSource.getPokemonDetail(widget.url);
    setState(() {
      detail = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del Pokémon')),
      body: loading || detail == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${detail!.name}', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            Text('Altura: ${detail!.height}'),
            Text('Peso: ${detail!.weight}'),
            const SizedBox(height: 12),
            const Text('Habilidades:'),
            ...detail!.abilities.map((a) => Text('- ${a.name}')).toList(),
          ],
        ),
      ),
    );
  }
}
