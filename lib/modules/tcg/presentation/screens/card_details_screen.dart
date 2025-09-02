import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/shared/constants/constants.dart';

import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/providers.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/card_screen/card_show_image.dart';

class CardDetailsScreen extends ConsumerStatefulWidget {
  final String cardId;

  const CardDetailsScreen({super.key, required this.cardId});

  @override
  CardDetailsScreenState createState() => CardDetailsScreenState();
}

class CardDetailsScreenState extends ConsumerState<CardDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(pokemonCardProvider.notifier).getCardById(widget.cardId);
  }

  @override
  Widget build(BuildContext context) {
    final PokemonCard? card = ref.watch(pokemonCardProvider)[widget.cardId];

    if (card == null) {
      return Scaffold(body: const FullScreenLoader());
    }

    return Scaffold(
      appBar: AppBar(title: Text('Detalles')),
      body: Stack(
        children: [
          Column(
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: CustomImageNetworkErrorHandler(
                    imageUrl: card.imageLowQuality ?? '',
                    width: ImageCardSizes.low().width,
                    height: ImageCardSizes.low().height,
                  ),
                ),
              ),

              Center(child: CardShowImage(imageUrl: card.imageHighQuality!)),
            ],
          ),
          CardDraggableScroll(card: card),
        ],
      ),
    );
  }
}
