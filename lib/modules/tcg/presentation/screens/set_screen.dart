import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/shared/utils/utils.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/providers.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/widgets.dart';

class SetScreen extends ConsumerStatefulWidget {
  final String setId;

  const SetScreen({super.key, required this.setId});

  @override
  SetScreenState createState() => SetScreenState();
}

class SetScreenState extends ConsumerState<SetScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(pokemonOneSetProvider.notifier).getSetById(widget.setId),
    );
  }

  List<PokemonBasicCard> getBasicCards(List<SetCard> set) {
    return set
        .map((card) => FromCardToPokemonBasicCard.fromPokemonCardsSet(card))
        .toList();
  }

  _dateFormat(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final setData = ref.watch(pokemonOneSetProvider);
    final height = MediaQuery.of(context).size.height * 0.7;

    if (setData.isLoading) {
      return Scaffold(body: const FullScreenLoader());
    }

    if (setData.sets[widget.setId] == null && !setData.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Set Not Found')),
        body: Center(child: const Text('Set Not Found')),
      );
    }

    return Scaffold(
      body: Visibility(
        visible: !setData.isLoading && setData.sets[widget.setId] != null,
        replacement: const FullScreenLoader(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true, // nunca desaparece
              expandedHeight: 70.0, // Altura inicial (se mueve hasta aquí)
              collapsedHeight: kToolbarHeight, // Altura mínima (AppBar normal)
              // floating: true, // desapoarce cuando hace scroll
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.2,
                title: SetScreenTitle(
                  title: setData.sets[widget.setId]!.name,
                  logo: setData.sets[widget.setId]!.logo,
                  width: 120,
                  height: 50,
                  // height: 120,
                ),
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
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemKeyValue(
                              label: 'Serie',
                              value: _CustomTextValue(
                                value:
                                    setData.sets[widget.setId]!.serie?.name ??
                                    'Sin Serie',
                              ),
                            ),
                            ItemKeyValue(
                              label: 'Release Date',
                              value: _CustomTextValue(
                                value: _dateFormat(
                                  setData.sets[widget.setId]!.releaseDate!
                                      .toString(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    CardsGrid(
                      cards: getBasicCards(setData.sets[widget.setId]!.cards),
                      height: height,
                    ),
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

class _CustomTextValue extends StatelessWidget {
  final String value;

  const _CustomTextValue({required this.value});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        value,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
