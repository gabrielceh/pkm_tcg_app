import 'package:flutter/material.dart';

class CardNameRarity extends StatelessWidget {
  final String cardName;
  final String cardRarity;

  const CardNameRarity({
    super.key,
    required this.cardName,
    required this.cardRarity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          cardName,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(cardRarity, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
