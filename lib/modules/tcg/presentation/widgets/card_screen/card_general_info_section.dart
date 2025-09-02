import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/utils/utils.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/card_screen/card_section_title.dart';

class CardGeneralInfoSection extends StatelessWidget {
  final PokemonCard card;

  const CardGeneralInfoSection({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(child: CardSectionTitle(title: "Información General")),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 10,
              children: [
                if (card.stage != null)
                  _ItemDetail(
                    label: "Pokémon",
                    value: _CustomTextValue(value: card.stage!),
                  ),

                if (card.trainerType != null)
                  _ItemDetail(
                    label: "Tipo de Entrenador",
                    value: _CustomTextValue(value: card.trainerType!),
                  ),

                if (card.types != null && card.types!.isNotEmpty)
                  _ItemDetail(
                    label: "Tipo",
                    value: Image.asset(
                      FromTypePokemonToTypeAsset.toAsset(card.types!.first),
                      width: 15,
                      height: 15,
                    ),
                  ),

                if (card.hp != null)
                  _ItemDetail(
                    label: "PS",
                    value: _CustomTextValue(value: card.hp!.toString()),
                  ),

                if (card.regulationMark != null)
                  _ItemDetail(
                    label: "Regulación",
                    value: _CustomTextValue(value: card.regulationMark!),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDetail extends StatelessWidget {
  final String label;
  final Widget value;

  const _ItemDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            width: 130,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(child: value),
          ),
        ],
      ),
    );
  }
}

class _CustomTextValue extends StatelessWidget {
  final String value;

  const _CustomTextValue({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
