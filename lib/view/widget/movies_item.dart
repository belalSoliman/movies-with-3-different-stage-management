import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/service/navigation_service/navigation_sevice.dart';
import 'package:movies/utils/app_padding.dart';
import 'package:movies/view/movie_details.dart';
import 'package:movies/view/widget/cached_image.dart';
import 'package:movies/view/widget/favoirt_btn.dart';
import 'package:movies/view/widget/geners_movies.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({super.key, required this.movies});
  final MoviesModle movies;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        'https://image.tmdb.org/t/p/w500${movies.backdropPath}';
    return InkWell(
      onTap: () {
        getIt<NavigationSevice>().navigate(MovieDetails(
          modle: movies,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(AppMargin.moviesItemMargin.w),
        width: double.infinity,
        child: IntrinsicWidth(
          child: Row(
            children: [
              CashedImage(
                imageurl: imageUrl,
              ),
              SizedBox(
                width: AppPadding.padding.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies.name ?? "no name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          weight: 20.w,
                        ),
                        SizedBox(
                          width: AppPadding.paddingSmall.w,
                        ),
                        Text(
                          "${movies.voteAverage}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const GenersMovies(
                      genres: ['Action', 'Adventure', 'Thriller'],
                    ),
                    SizedBox(
                      height: AppPadding.paddingSmall.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          weight: 10.w,
                        ),
                        SizedBox(
                          width: AppPadding.paddingSmall.w,
                        ),
                        Text(
                          "${movies.firstAirDate}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        const FavoirtBtn(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
