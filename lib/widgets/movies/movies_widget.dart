import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_icons.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/screens/movie_details.dart';
import 'package:provider/provider.dart';
import '../../service/init_getit.dart';
import '../../service/navigation_service.dart';
import '../cached_image.dart';
import 'favorite_btn.dart';
import 'genres_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MovieModel moviess = Provider.of<MovieModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            getIt<NavigationService>().navigate(ChangeNotifierProvider.value(
                value: moviess, child: const MovieDetailsScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedImageWidget(
                      imgUrl:
                          "https://image.tmdb.org/t/p/w500/${moviess.backdropPath}",
                      // ,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          moviess.originalTitle,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text("${moviess.voteAverage.toStringAsFixed(1)}/10")
                            //,
                          ],
                        ),
                        const SizedBox(height: 10),
                        GenresListWidget(
                          movieModel: moviess,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyAppIcons.watchLaterOutlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              moviess.releaseDate,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            const FavoriteBtnWidget(
                                // movieModel: movieModel,
                                )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
