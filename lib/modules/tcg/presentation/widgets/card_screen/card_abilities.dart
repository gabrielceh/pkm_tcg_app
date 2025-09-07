import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

import 'card_section_title.dart';

class CardAbilities extends StatelessWidget {
  final List<CardAbility> abilities;

  const CardAbilities({super.key, required this.abilities});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(child: CardSectionTitle(title: "Abilities")),

          ...abilities.map(
            (attack) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  attack.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  attack.effect!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
