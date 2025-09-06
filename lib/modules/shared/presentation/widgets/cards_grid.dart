import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/entities/pokemon_basic_card.dart';

class CardsGrid extends StatefulWidget {
  final List<PokemonBasicCard> cards;
  final double? height;

  const CardsGrid({super.key, required this.cards, this.height});

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
      // height: 450,
      // height: double.infinity,
      height: widget.height ?? MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.71, // mas alto que ancho de los hijo
                  maxCrossAxisExtent: 200, // anncho maximo de los hijos
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                controller: scrollController,
                itemCount: widget.cards.length,
                itemBuilder: (context, index) {
                  final card = widget.cards[index];

                  return GestureDetector(
                    onTap: () {
                      context.push('/card-details/${card.id}');
                    },
                    child: CustomImageNetworkErrorHandler(
                      imageUrl: card.imageUrl!,
                    ),
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
