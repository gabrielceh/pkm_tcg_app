class PokemonCardResponse {
  String id;
  String name;
  String cardType;
  String? image;
  String? rarity;
  String? type;
  int? hp;
  String? evolvesFrom;
  List<CardAttackResponse>? attacks;

  PokemonCardResponse({
    required this.id,
    required this.name,
    required this.cardType,
    this.image,
    this.rarity,
    this.type,
    this.hp,
    this.evolvesFrom,
    this.attacks,
  });

  factory PokemonCardResponse.fromJson(Map<String, dynamic> json) =>
      PokemonCardResponse(
        id: json["id"],
        name: json["name"],
        cardType: json["supertype"],
        image: json["image"],
        rarity: json["rarity"],
        type: json["type"],
        hp: json["hp"] == null ? 0 : json["hp"]!.toInt(),
        evolvesFrom: json["evolvesFrom"],
        attacks: json["attacks"] == null
            ? []
            : List<CardAttackResponse>.from(
                json["attacks"]!.map(
                  (x) => CardAttackResponse(
                    cost: List<String>.from(x["cost"]!.map((x) => x)),
                    name: x["name"],
                    effect: x["effect"],
                    damage: x["damage"],
                  ),
                ),
              ).toList(),
      );
}

class CardAttackResponse {
  final List<String> cost;
  final String name;
  final String? effect;
  final int damage;

  CardAttackResponse({
    required this.cost,
    required this.name,
    this.effect,
    required this.damage,
  });
}
