import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/entities/pokemon_basic_card.dart';

class CardsGrid extends StatefulWidget {
  final List<PokemonBasicCard> cards;

  const CardsGrid({super.key, required this.cards});

  @override
  State<CardsGrid> createState() => _CardsGridState();
}

class _CardsGridState extends State<CardsGrid> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: scrollController.position.maxScrollExtent,
      height: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.71, // mas alto que ancho de los hijo
                  maxCrossAxisExtent: 200, // anncho maximo de los hijos
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                controller: scrollController,
                itemCount: widget.cards.length,
                itemBuilder: (context, index) {
                  return CustomImageNetworkErrorHandler(
                    imageUrl: widget.cards[index].imageUrl!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
