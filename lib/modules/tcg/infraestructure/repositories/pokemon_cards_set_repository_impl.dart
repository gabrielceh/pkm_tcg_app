import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class PokemonCardsSetRepositoryImpl extends PokemonCardsSetRepository {
  final PokemonCardsSetDatasource datasource;

  PokemonCardsSetRepositoryImpl(this.datasource);

  @override
  Future<List<PokemonCardsSet>> getPokemonSets({int? page = 1}) {
    return datasource.getPokemonSets(page: page);
  }

  @override
  Future<PokemonCardsSet> getPokemonSetById(String id) {
    return datasource.getPokemonSetById(id);
  }
}
