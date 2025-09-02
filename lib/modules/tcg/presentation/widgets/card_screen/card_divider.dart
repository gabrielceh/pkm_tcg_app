import 'package:flutter/material.dart';

class CardDivider extends StatelessWidget {
  const CardDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(0, 2)),
          BoxShadow(color: Colors.white, blurRadius: 3, offset: Offset(0, -2)),
        ],
      ),
    );
  }
}
