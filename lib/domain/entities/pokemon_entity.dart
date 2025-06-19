import 'package:poke_api/domain/entities/pokemon_entity.dart';

class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final int order;
  final List<String> types;
  final List<String> abilities;
  final String spriteUrl;
  final Map<String, int> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.order,
    required this.types,
    required this.abilities,
    required this.spriteUrl,
    required this.stats,
  });
}
