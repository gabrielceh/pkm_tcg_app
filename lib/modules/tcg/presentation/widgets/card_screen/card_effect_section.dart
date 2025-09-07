import 'package:flutter/material.dart';

import 'card_section_title.dart';

class CardEffectSection extends StatelessWidget {
  final String effect;

  const CardEffectSection({super.key, required this.effect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(child: CardSectionTitle(title: "Effect")),
          Text(
            effect,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
