import 'package:pkm_tcg_app/modules/tcg/domain/entities/color_type_card.dart';

class PokemonCard {
  String id;
  String name;
  String cardType;
  List<String> subtypes;
  String hp;
  List<ColorTypeCard> types;
  List<String> evolvesTo;
  List<String> rules;
  List<CardAttack> attacks;
  CardSet dataSet;
  String number;
  String artist;
  String rarity;
  CardImages images;
  Tcgplayer tcgplayer;

  PokemonCard({
    required this.id,
    required this.name,
    required this.cardType,
    required this.subtypes,
    required this.hp,
    required this.types,
    required this.evolvesTo,
    required this.rules,
    required this.attacks,
    required this.dataSet,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.images,
    required this.tcgplayer,
  });
}

class CardAttack {
  String name;
  List<String> cost;
  int convertedEnergyCost;
  String damage;
  String text;

  CardAttack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });
}

class CardSet {
  String id;
  String name;
  CardSetImages images;

  CardSet({required this.id, required this.name, required this.images});
}

class CardSetImages {
  String symbol;
  String logo;

  CardSetImages({required this.symbol, required this.logo});
}

class CardImages {
  String small;
  String large;

  CardImages({required this.small, required this.large});
}

class Tcgplayer {
  String url;
  String updatedAt;
  Prices prices;

  Tcgplayer({required this.url, required this.updatedAt, required this.prices});
}

class Prices {
  Holofoil holofoil;

  Prices({required this.holofoil});
}

class Holofoil {
  final double low;
  final double mid;
  final double high;
  final double market;
  final double? directLow;

  Holofoil({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    required this.directLow,
  });
}
