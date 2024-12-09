import 'package:flutter/material.dart';

class FavoirtBtn extends StatelessWidget {
  const FavoirtBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onPressed: () {},
    );
  }
}
