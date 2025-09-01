import 'package:flutter/material.dart';

import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/card_screen/card_set_section.dart';
import 'card_name_rarity.dart';

class CardDraggableScroll extends StatelessWidget {
  final PokemonCard card;

  const CardDraggableScroll({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3, // Tamaño inicial (20% de la pantalla)
      minChildSize: 0.3, // Tamaño mínimo
      maxChildSize: 0.8, // Tamaño máximo al arrastrar
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),

          child: Column(
            children: [
              CustomDragHandle(controller: scrollController),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      child: Column(
                        spacing: 12,
                        children: [
                          CardNameRarity(
                            cardName: card.name,
                            cardRarity: card.rarity ?? '',
                          ),

                          CardSetSection(
                            cardSet: card.set,
                            idInSet: card.idInSet,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
