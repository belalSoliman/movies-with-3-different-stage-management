import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/geners_model.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/utils/genrs_utlis.dart';

class GenersMovies extends StatelessWidget {
  final MoviesModle genres;

  const GenersMovies({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    List<Genres> genrs = GenrsUtlis.genersNames(genres.genreIds!);
    return Wrap(
      spacing: 5.0.w,
      children: genrs.map((genre) {
        return Chip(
          label: Text(genre.name),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
            side: const BorderSide(color: Colors.grey),
          ),
        );
      }).toList(),
    );
  }
}
