import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies/view_models/movies_provider.dart';
import 'package:movies/view_models/theme_provider.dart';
import 'package:provider/provider.dart';

import '../constants/my_app_icons.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../widgets/movies/movies_widget.dart';
import 'favorites_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("MoviesScreen built");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              MyAppIcons.favoriteRounded,
              color: Colors.red,
            ),
          ),
          Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) {
              log("MoviesScreen ");

              return IconButton(
                onPressed: () async {
                  themeProvider.toggleTheme();
                },
                icon: const Icon(
                  MyAppIcons.darkMode,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(builder: (context, MoviesProvider movies, child) {
        if (movies.isLoading && movies.movies.isEmpty) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !movies.isLoading) {
                movies.getMovies();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: movies.movies.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: movies.movies[index], child: const MoviesWidget());
              },
            ),
          );
        }
      }),
    );
  }
}
