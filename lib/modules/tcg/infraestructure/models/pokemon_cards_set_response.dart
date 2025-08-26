class PokemonCardsSetResponse {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final Legalities legalities;
  final String ptcgoCode;
  final String releaseDate;
  final String updatedAt;
  final SetImagesResponse images;

  PokemonCardsSetResponse({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  factory PokemonCardsSetResponse.fromJson(Map<String, dynamic> json) =>
      PokemonCardsSetResponse(
        id: json["id"],
        name: json["name"],
        series: json["series"],
        printedTotal: json["printedTotal"],
        total: json["total"],
        legalities: Legalities.fromJson(json["legalities"]),
        ptcgoCode: json["ptcgoCode"],
        releaseDate: json["releaseDate"],
        updatedAt: json["updatedAt"],
        images: SetImagesResponse.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "series": series,
    "printedTotal": printedTotal,
    "total": total,
    "legalities": legalities.toJson(),
    "ptcgoCode": ptcgoCode,
    "releaseDate": releaseDate,
    "updatedAt": updatedAt,
    "images": images.toJson(),
  };
}

class SetImagesResponse {
  final String symbol;
  final String logo;

  SetImagesResponse({required this.symbol, required this.logo});

  factory SetImagesResponse.fromJson(Map<String, dynamic> json) =>
      SetImagesResponse(symbol: json["symbol"], logo: json["logo"]);

  Map<String, dynamic> toJson() => {"symbol": symbol, "logo": logo};
}

class Legalities {
  final String? unlimited;
  final String? standard;
  final String? expanded;

  Legalities({this.unlimited = "", this.standard = "", this.expanded = ""});

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
    unlimited: json["unlimited"] ? json["unlimited"] : "",
    standard: json["standard"] ? json["standard"] : "",
    expanded: json["expanded"] ? json["expanded"] : "",
  );

  Map<String, dynamic> toJson() => {
    "unlimited": unlimited,
    "standard": standard,
    "expanded": expanded,
  };
}
