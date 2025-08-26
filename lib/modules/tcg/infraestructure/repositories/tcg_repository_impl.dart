import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class TcgRepositoryImpl extends TcgRepository {
  final TcgDatasource datasource;

  TcgRepositoryImpl(this.datasource);

  @override
  Future<PaginatedPokemonCards> getPokemonCards({int? page = 1}) {
    return datasource.getPokemonCards(page: page);
  }

  @override
  Future<PaginatedPokemonCards> getPokemonCardsBySet({
    required String setId,
    int? page = 1,
  }) {
    return datasource.getPokemonCardsBySet(setId: setId, page: page);
  }

  @override
  Future<List<PokemonCard>> getPokemonCardById(String id) {
    return datasource.getPokemonCardById(id);
  }

  @override
  Future<List<PokemonCardsSet>> getPokemonSets({int? page = 1}) {
    return datasource.getPokemonSets(page: page);
  }

  @override
  Future<PokemonCardsSet> getPokemonSetById(String id) {
    return datasource.getPokemonSetById(id);
  }
}
