import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/shared/utils/utils.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/providers.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/home_screen/sets_horizontal_list_view.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonSetsProvider.notifier).loadNextSets();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonSetsProvider.notifier).loadNextSets();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  List<PokemonBasicCard> getBasicCards(List<SetCard> set) {
    return set
        .map((card) => FromCardToPokemonBasicCard.fromPokemonCardsSet(card))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    final setsState = ref.watch(pokemonSetsProvider);
    final oneSetState = ref.watch(pokemonOneSetProvider);

    return Scaffold(
      body: Visibility(
        visible: !initialLoading,
        replacement: const FullScreenLoader(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppBar(title: 'Pkm Tcg'),
                titlePadding: const EdgeInsets.only(left: 10),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 1, (
                context,
                index,
              ) {
                return Column(
                  spacing: 10,
                  children: [
                    SetsHorizontalListView(sets: setsState.sets),

                    if (oneSetState.set == null) const SizedBox(),

                    if (oneSetState.set != null)
                      CardsSectionTitle(
                        title: oneSetState.set!.name,
                        logo: oneSetState.set!.logo,
                        width: 200,
                      ),
                    CardsGrid(cards: getBasicCards(oneSetState.set!.cards)),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
