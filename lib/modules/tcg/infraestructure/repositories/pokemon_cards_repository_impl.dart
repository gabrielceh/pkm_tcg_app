import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class PokemonCardsRepositoryImpl extends PokemonCardsRepository {
  final PokemonCardsDatasource datasource;

  PokemonCardsRepositoryImpl(this.datasource);

  @override
  Future<PokemonCard> getPokemonCardById(String id) {
    return datasource.getPokemonCardById(id);
  }
}
