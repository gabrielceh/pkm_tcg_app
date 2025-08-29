import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/pokemon_card_mapper.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

class PkmTcgCardsDatasource extends PokemonCardsDatasource {
  PokemonCard _jsonToPokemonCard(Map<String, dynamic> json) {
    final cardModel = PokemonCardResponse.fromJson(json);
    return PokemonCardMapper.pokemonCardToEntity(cardModel);
  }

  @override
  Future<List<PokemonCard>> getPokemonCardById(String id) {
    // TODO: implement getPokemonCardById
    throw UnimplementedError();
  }
}
