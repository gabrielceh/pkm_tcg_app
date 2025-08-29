class PokemonCardsSet {
  final SetCardCount cardCount;
  final List<SetCard> cards;
  final String id;
  final String name;
  final SetSerie? serie;
  final SetLegal? legal;
  final String? logo;
  final DateTime? releaseDate;
  final String? symbol;

  PokemonCardsSet({
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
}

class SetCardCount {
  final int? firstEd;
  final int? holo;
  final int? normal;
  final int? reverse;
  final int official;
  final int total;

  SetCardCount({
    this.firstEd,
    this.holo,
    this.normal,
    this.reverse,
    required this.official,
    required this.total,
  });
}

class SetCard {
  final String id;
  final String image;
  final String localId;
  final String name;

  SetCard({
    required this.id,
    required this.image,
    required this.localId,
    required this.name,
  });
}

class SetLegal {
  final bool expanded;
  final bool standard;

  SetLegal({required this.expanded, required this.standard});
}

class SetSerie {
  final String id;
  final String name;

  SetSerie({required this.id, required this.name});
}
