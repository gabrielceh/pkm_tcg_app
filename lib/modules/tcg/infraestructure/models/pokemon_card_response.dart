class PokemonCardResponse {
  String id;
  String localId;
  CardSetDetailsResponse set;
  String name;
  String category;
  String? rarity;
  String? image;
  List<String>? types;
  int? hp;
  String? evolvesFrom;
  String? stage;
  String? effect;
  String? regulationMark;
  String? trainerType;
  List<CardAttackResponse>? attacks;
  List<CardAbilityResponse>? abilities;

  PokemonCardResponse({
    required this.id,
    required this.name,
    required this.localId,
    required this.set,
    required this.category,
    this.image,
    this.rarity,
    this.types,
    this.hp,
    this.evolvesFrom,
    this.stage,
    this.effect,
    this.regulationMark,
    this.trainerType,
    this.attacks,
    this.abilities,
  });

  factory PokemonCardResponse.fromJson(Map<String, dynamic> json) =>
      PokemonCardResponse(
        id: json["id"] ?? '',
        localId: json["localId"] ?? '',
        set: CardSetDetailsResponse.fromJson(json["set"]),
        name: json["name"] ?? '',
        category: json["category"] ?? '',
        image: json["image"] == null ? null : json['image'],
        rarity: json["rarity"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]),
        hp: json["hp"] == null ? null : json['hp']!.toInt(),
        evolvesFrom: json["evolvesFrom"] == null ? null : json['evolvesFrom'],
        stage: json["stage"] == null ? null : json['stage'],
        effect: json["effect"] == null ? null : json['effect'],
        regulationMark: json["regulationMark"] == null
            ? null
            : json['regulationMark'],
        trainerType: json["trainerType"] == null ? null : json['trainerType'],
        attacks: json["attacks"] == null
            ? null
            : List<CardAttackResponse>.from(
                json["attacks"]!.map(
                  (attack) => CardAttackResponse.fromJson(attack),
                ),
              ).toList(),
        abilities: json["abilities"] == null
            ? null
            : List<CardAbilityResponse>.from(
                json["abilities"]!.map(
                  (ability) => CardAbilityResponse.fromJson(ability),
                ),
              ).toList(),
      );
}

class CardAttackResponse {
  final List<String> cost;
  final String name;
  final String? effect;
  final String? damage;

  CardAttackResponse({
    required this.cost,
    required this.name,
    this.effect,
    this.damage,
  });

  factory CardAttackResponse.fromJson(Map<String, dynamic> json) =>
      CardAttackResponse(
        cost: json["cost"] == null
            ? []
            : List<String>.from(json["cost"]!.map((x) => x)),
        name: json["name"] ?? '-',
        effect: json["effect"] == null ? null : json['effect'],
        damage: json["damage"] == null ? null : json['damage'].toString(),
      );
}

class CardAbilityResponse {
  String? type;
  String? name;
  String? effect;

  CardAbilityResponse({this.type, this.name, this.effect});

  factory CardAbilityResponse.fromJson(Map<String, dynamic> json) =>
      CardAbilityResponse(
        type: json["type"] == null ? null : json['type'],
        name: json["name"] == null ? null : json['name'],
        effect: json["effect"] == null ? null : json['effect'],
      );
}

class CardSetDetailsResponse {
  String id;
  String name;
  String? logo;
  String? symbol;
  CardSetCountResponse? cardCount;

  CardSetDetailsResponse({
    required this.id,
    required this.name,
    this.logo,
    this.symbol,
    this.cardCount,
  });

  factory CardSetDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CardSetDetailsResponse(
        id: json["id"],
        name: json["name"],
        logo: json["logo"] == null ? null : json['logo'],
        symbol: json["symbol"] == null ? null : json['symbol'],
        cardCount: json["cardCount"] == null
            ? null
            : CardSetCountResponse.fromJson(json["cardCount"]),
      );
}

class CardSetCountResponse {
  String? official;
  String? total;

  CardSetCountResponse({this.official, this.total});

  factory CardSetCountResponse.fromJson(Map<String, dynamic> json) =>
      CardSetCountResponse(
        official: json["official"] == null ? null : json['official'].toString(),
        total: json["total"] == null ? null : json['total'].toString(),
      );
}
