import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/widgets/movies/favorite_btn.dart';
import 'package:provider/provider.dart';

import '../widgets/cached_image.dart';
import '../widgets/movies/genres_list_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieModel>(context);
    log(2);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.45,
              width: double.infinity,
              child: CachedImageWidget(
                imgUrl:
                    "https://image.tmdb.org/t/p/w500/${moviesProvider.backdropPath}",
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    // child: Container(color: Colors.red,),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                Text(
                                  moviesProvider.title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    // color: Theme.of(context).textSelectionColor,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                        "${moviesProvider.voteAverage.toStringAsFixed(1)}/10"),
                                    const Spacer(),
                                    Text(
                                      moviesProvider.releaseDate,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                GenresListWidget(
                                  movieModel: moviesProvider,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  moviesProvider.overview,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: FavoriteBtnWidget(
                                movieefav: moviesProvider,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
