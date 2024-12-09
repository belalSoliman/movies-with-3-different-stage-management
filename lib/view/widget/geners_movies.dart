import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenersMovies extends StatelessWidget {
  final List<String> genres;

  const GenersMovies({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0.w,
      children: genres.map((genre) {
        return Chip(
          label: Text(genre),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
            side: const BorderSide(color: Colors.grey),
          ),
        );
      }).toList(),
    );
  }
}
