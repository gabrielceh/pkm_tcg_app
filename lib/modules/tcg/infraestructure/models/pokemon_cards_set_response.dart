class PokemonCardsSetResponse {
  final SetCardCountResponse cardCount;
  final List<SetCardResponse> cards;
  final String id;
  final String name;
  final SetSerieResponse? serie;
  final SetLegalResponse? legal;
  final String? logo;
  final DateTime? releaseDate;
  final String? symbol;

  PokemonCardsSetResponse({
    required this.cardCount,
    required this.cards,
    required this.id,
    required this.name,
    this.serie,
    this.legal,
    this.releaseDate,
    this.logo,
    this.symbol,
  });

  factory PokemonCardsSetResponse.fromJson(Map<String, dynamic> json) =>
      PokemonCardsSetResponse(
        id: json["id"],
        name: json["name"],
        cardCount: SetCardCountResponse.fromJson(json["cardCount"]),
        cards: json["cards"] == null
            ? []
            : List<SetCardResponse>.from(
                json["cards"].map((x) => SetCardResponse.fromJson(x)),
              ),
        logo: json["logo"],
        symbol: json["symbol"],
        legal: json["legal"] == null
            ? null
            : SetLegalResponse.fromJson(json["legal"]),
        releaseDate: json["releaseDate"] == null
            ? null
            : DateTime.parse(json["releaseDate"]),
        serie: json["serie"] == null
            ? null
            : SetSerieResponse.fromJson(json["serie"]),
      );
}

class SetCardCountResponse {
  final int? firstEd;
  final int? holo;
  final int? normal;
  final int? reverse;
  final int official;
  final int total;

  SetCardCountResponse({
    this.firstEd,
    this.holo,
    this.normal,
    this.reverse,
    required this.official,
    required this.total,
  });

  factory SetCardCountResponse.fromJson(Map<String, dynamic> json) =>
      SetCardCountResponse(
        firstEd: json["firstEd"] == null ? null : json['firstEd'],
        holo: json["holo"] == null ? null : json['holo'],
        normal: json["normal"] == null ? null : json['normal'],
        reverse: json["reverse"] == null ? null : json['reverse'],
        official: json["official"] == null ? null : json['official'],
        total: json["total"],
      );
}

class SetCardResponse {
  final String id;
  final String image;
  final String localId;
  final String name;

  SetCardResponse({
    required this.id,
    required this.image,
    required this.localId,
    required this.name,
  });

  factory SetCardResponse.fromJson(Map<String, dynamic> json) =>
      SetCardResponse(
        id: json["id"],
        image: json["image"],
        localId: json["localId"],
        name: json["name"],
      );
}

class SetLegalResponse {
  final bool expanded;
  final bool standard;

  SetLegalResponse({required this.expanded, required this.standard});

  factory SetLegalResponse.fromJson(Map<String, dynamic> json) =>
      SetLegalResponse(expanded: json["expanded"], standard: json["standard"]);
}

class SetSerieResponse {
  final String id;
  final String name;

  SetSerieResponse({required this.id, required this.name});

  factory SetSerieResponse.fromJson(Map<String, dynamic> json) =>
      SetSerieResponse(id: json["id"], name: json["name"]);
}
