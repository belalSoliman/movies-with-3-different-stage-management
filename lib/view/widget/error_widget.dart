import 'package:flutter/material.dart';

class ErrorWidgets extends StatelessWidget {
  const ErrorWidgets({super.key, required this.onRetry});

  @override
  final Function onRetry;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Something went wrong'),
        TextButton(
          onPressed: () {
            onRetry();
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
