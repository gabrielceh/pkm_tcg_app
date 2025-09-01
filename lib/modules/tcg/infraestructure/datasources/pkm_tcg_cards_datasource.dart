import 'package:pkm_tcg_app/config/api_service/api_service_barrel.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/pokemon_card_mapper.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

class PkmTcgCardsDatasource extends PokemonCardsDatasource {
  final ApiClient _apiClient = ApiManager.get('cards');

  PokemonCard _jsonToPokemonCard(Map<String, dynamic> json) {
    final cardModel = PokemonCardResponse.fromJson(json);
    return PokemonCardMapper.pokemonCardToEntity(cardModel);
  }

  @override
  Future<PokemonCard> getPokemonCardById(String id) async {
    final dataResponse = await _apiClient.get('/$id');
    final card = _jsonToPokemonCard(dataResponse);
    print(card);
    return card;
    // try {
    //   final dataResponse = await _apiClient.get('/$id');
    //   final card = _jsonToPokemonCard(dataResponse);
    //   print(card);

    //   return card;
    // } catch (e) {
    //   print("Error getPokemonCardById: $e");
    //   return PokemonCard(
    //     id: "",
    //     name: "",
    //     idInSet: "",
    //     set: CardSetDetails(id: "", name: "", logo: "", symbol: ""),
    //     cardType: CategoryCard.pokemon,
    //     rarity: "",
    //     imageHighQuality: "",
    //     imageLowQuality: "",
    //     types: [],
    //     hp: 0,
    //     evolvesFrom: "",
    //     attacks: [],
    //   );
    // }
  }
}
