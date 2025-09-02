import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/utils/utils.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class CardAttackItem extends StatelessWidget {
  final CardAttack attack;

  const CardAttackItem({super.key, required this.attack});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Row(
                  spacing: 2,
                  children: [
                    ...attack.cost.map(
                      (type) => Image.asset(
                        FromTypePokemonToTypeAsset.toAsset(type),
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ],
                ),

                Text(
                  attack.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (attack.damage != null)
              Text(
                attack.damage!.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),

        if (attack.effect != null)
          Text(
            attack.effect!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
      ],
    );
  }
}
