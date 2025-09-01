import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

import 'pokemon_card_repository_provider.dart';

// ! Provider
final pokemonCardProvider =
    StateNotifierProvider<PokemonCardNotifier, Map<String, PokemonCard>>((ref) {
      final repository = ref.watch(pokemonCardsRepositoryProvider);

      return PokemonCardNotifier(getCard: repository.getPokemonCardById);
    });

typedef GetPokemonCardCallback = Future<PokemonCard> Function(String id);

// ! Notifier
class PokemonCardNotifier extends StateNotifier<Map<String, PokemonCard>> {
  final GetPokemonCardCallback getCard;

  PokemonCardNotifier({required this.getCard}) : super({});

  Future<void> getCardById(String id) async {
    if (state[id] != null) return;

    final card = await getCard(id);

    print(card);

    if (card.id.isEmpty) {
      return;
    }

    state = {...state, id: card};
  }
}
