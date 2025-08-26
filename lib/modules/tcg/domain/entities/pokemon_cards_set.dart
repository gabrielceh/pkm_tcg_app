class PokemonCardsSet {
  String id;
  String name;
  String series;
  int printedTotal;
  int total;
  String ptcgoCode;
  String releaseDate;
  String updatedAt;
  ImagesSet images;

  PokemonCardsSet({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });
}

class ImagesSet {
  String symbol;
  String logo;

  ImagesSet({required this.symbol, required this.logo});
}
