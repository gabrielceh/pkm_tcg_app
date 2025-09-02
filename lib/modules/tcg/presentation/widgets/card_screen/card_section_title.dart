import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';

class CardSectionTitle extends StatelessWidget {
  final String title;

  const CardSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 5,
      color: Colors.black12,
      offset: const Offset(0, 3),
      child: Container(
        height: 25,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
