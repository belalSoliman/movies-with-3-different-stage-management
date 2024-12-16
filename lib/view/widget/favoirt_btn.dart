import 'package:flutter/material.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/init_getit.dart';

class FavoirtBtn extends StatelessWidget {
  const FavoirtBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onPressed: () async {
        try {
          await getIt<ApiService>().fetchMovie();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Movie fetched successfully'),
              backgroundColor: Colors.white,
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error fetching movie: $e')),
          );
        }
      },
    );
  }
}
