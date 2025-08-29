import 'package:pkm_tcg_app/modules/tcg/domain/entities/color_type_card.dart';

import 'category_card.dart';

class PokemonCard {
  String id;
  String name;
  CategoryCard cardType;
  String? imageHighQuality;
  String? imageLowQuality;
  String? rarity;
  ColorTypeCard? type;
  int? hp;
  String? evolvesFrom;
  List<CardAttack>? attacks;

  PokemonCard({
    required this.id,
    required this.name,
    required this.cardType,
    this.imageHighQuality,
    this.imageLowQuality,
    this.rarity,
    this.type,
    this.hp,
    this.evolvesFrom,
    this.attacks,
  });
}

class CardAttack {
  final List<String> cost;
  final String name;
  final String? effect;
  final int damage;

  CardAttack({
    required this.cost,
    required this.name,
    this.effect,
    required this.damage,
  });
}
