import 'package:pkm_tcg_app/modules/tcg/domain/entities/color_type_card.dart';

import 'category_card.dart';

class PokemonCard {
  String id;
  String idInSet;
  String name;
  CardSetDetails set;
  CategoryCard cardType;
  String? rarity;
  String? imageHighQuality;
  String? imageLowQuality;
  List<ColorTypeCard>? types;
  int? hp;
  String? evolvesFrom;
  String? stage;
  List<CardAttack>? attacks;
  List<CardAbility>? abilities;

  PokemonCard({
    required this.id,
    required this.idInSet,
    required this.name,
    required this.set,
    required this.cardType,
    this.rarity,
    this.imageHighQuality,
    this.imageLowQuality,
    this.types,
    this.hp,
    this.evolvesFrom,
    this.stage,
    this.attacks,
    this.abilities,
  });
}

class CardAttack {
  final List<String> cost;
  final String name;
  final String? effect;
  final String? damage;

  CardAttack({
    required this.cost,
    required this.name,
    this.effect,
    this.damage,
  });
}

class CardAbility {
  String? type;
  String? name;
  String? effect;

  CardAbility({this.type, this.name, this.effect});
}

class CardSetDetails {
  String id;
  String name;
  String? logo;
  String? symbol;
  CardSetCount? cardCount;

  CardSetDetails({
    required this.id,
    required this.name,
    this.logo,
    this.symbol,
    this.cardCount,
  });
}

class CardSetCount {
  String? official;
  String? total;

  CardSetCount({this.official, this.total});
}
