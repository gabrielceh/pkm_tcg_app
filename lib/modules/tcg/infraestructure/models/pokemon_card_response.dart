// To parse this JSON data, do
//
//     final pokemonCards = pokemonCardsFromJson(jsonString);

class PokemonCardResponse {
  final String id;
  final String name;
  final String supertype;
  final List<String> subtypes;
  final String? hp;
  final List<String>? types;
  final List<String>? evolvesTo;
  final List<CardAttackResponse>? attacks;
  final List<String>? rules;
  final CardSetResponse pokemonCardSet;
  final String number;
  final String? artist;
  final String rarity;
  final Map<String, String> images;
  final TcgplayerResponse tcgplayer;

  PokemonCardResponse({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    this.hp,
    this.types,
    this.evolvesTo,
    this.attacks,
    required this.pokemonCardSet,
    required this.number,
    this.artist,
    required this.rarity,
    required this.images,
    required this.tcgplayer,

    this.rules,
  });

  factory PokemonCardResponse.fromJson(Map<String, dynamic> json) =>
      PokemonCardResponse(
        id: json["id"],
        name: json["name"],
        supertype: json["supertype"],
        subtypes: List<String>.from(json["subtypes"].map((x) => x)),
        hp: json["hp"],
        types: json["types"] == null ? [] : json["types"]!.map((x) => x),
        evolvesTo: json["evolvesTo"] == null
            ? []
            : List<String>.from(json["evolvesTo"]!.map((x) => x)),
        attacks: json["attacks"] == null
            ? []
            : List<CardAttackResponse>.from(
                json["attacks"]!.map((x) => CardAttackResponse.fromJson(x)),
              ),

        pokemonCardSet: CardSetResponse.fromJson(json["set"]),
        number: json["number"],
        artist: json["artist"],
        rarity: json["rarity"],

        images: json["images"],
        tcgplayer: TcgplayerResponse.fromJson(json["tcgplayer"]),

        rules: json["rules"] == null
            ? []
            : List<String>.from(json["rules"]!.map((x) => x)),
      );
}

class Ability {
  final String name;
  final String text;
  final String type;

  Ability({required this.name, required this.text, required this.type});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      Ability(name: json["name"], text: json["text"], type: json["type"]);
}

class CardAttackResponse {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  CardAttackResponse({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  factory CardAttackResponse.fromJson(Map<String, dynamic> json) =>
      CardAttackResponse(
        name: json["name"],
        cost: List<String>.from(json["cost"].map((x) => x!)),
        convertedEnergyCost: json["convertedEnergyCost"],
        damage: json["damage"],
        text: json["text"],
      );
}

class CardSetResponse {
  final String id;
  final String name;
  final Map<String, String> images;

  CardSetResponse({required this.id, required this.name, required this.images});

  factory CardSetResponse.fromJson(Map<String, dynamic> json) =>
      CardSetResponse(
        id: json["id"],
        name: json["name"],
        images: json["images"],
      );
}

class TcgplayerResponse {
  final String url;
  final String updatedAt;
  final PricesResponse prices;

  TcgplayerResponse({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory TcgplayerResponse.fromJson(Map<String, dynamic> json) =>
      TcgplayerResponse(
        url: json["url"],
        updatedAt: json["updatedAt"],
        prices: PricesResponse.fromJson(json["prices"]),
      );
}

class PricesResponse {
  final HolofoilResponse? reverseHolofoil;
  final HolofoilResponse? normal;
  final HolofoilResponse? holofoil;

  PricesResponse({this.reverseHolofoil, this.normal, this.holofoil});

  factory PricesResponse.fromJson(Map<String, dynamic> json) => PricesResponse(
    reverseHolofoil: json["reverseHolofoil"] == null
        ? null
        : HolofoilResponse.fromJson(json["reverseHolofoil"]),
    normal: json["normal"] == null
        ? null
        : HolofoilResponse.fromJson(json["normal"]),
    holofoil: json["holofoil"] == null
        ? null
        : HolofoilResponse.fromJson(json["holofoil"]),
  );
}

class HolofoilResponse {
  final double low;
  final double mid;
  final double high;
  final double market;
  final double? directLow;

  HolofoilResponse({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    required this.directLow,
  });

  factory HolofoilResponse.fromJson(Map<String, dynamic> json) =>
      HolofoilResponse(
        low: json["low"]?.toDouble(),
        mid: json["mid"]?.toDouble(),
        high: json["high"]?.toDouble(),
        market: json["market"]?.toDouble(),
        directLow: json["directLow"]?.toDouble(),
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);
}
