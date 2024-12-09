import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/utils/app_padding.dart';
import 'package:movies/view/widget/cached_image.dart';
import 'package:movies/view/widget/geners_movies.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppMargin.moviesItemMargin.w),
      width: double.infinity,
      color: Colors.grey.shade100,
      child: IntrinsicWidth(
        child: Row(
          children: [
            const CashedImage(),
            SizedBox(
              width: AppPadding.padding.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deadpool & Wolverine',
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
                        '8.5/10',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Action, Adventure, Thriller',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  const GenersMovies(
                    genres: ['Action', 'Adventure', 'Thriller'],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
