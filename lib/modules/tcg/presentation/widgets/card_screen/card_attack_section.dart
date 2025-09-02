import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'card_attack_item.dart';
import 'card_section_title.dart';

class CardAttackSection extends StatelessWidget {
  final List<CardAttack> attacks;

  const CardAttackSection({super.key, required this.attacks});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(child: CardSectionTitle(title: "Ataques")),

          ...attacks.map((attack) => CardAttackItem(attack: attack)),
        ],
      ),
    );
  }
}
