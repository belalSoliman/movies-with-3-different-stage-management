import 'package:flutter/material.dart';
import 'package:movies/models/geners_model.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/view/widget/custom_appbar.dart';
import 'package:movies/view/widget/movies_item.dart';

class MoviesScreen extends StatefulWidget {
  final List<Genres> genrz;

  const MoviesScreen({super.key, required this.genrz});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MoviesModle> _movies = [];
  int _currentPage = 1;
  bool _isfetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_isfetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isfetching) return;
    setState(() {
      _isfetching = true;
    });
    try {
      final List<MoviesModle> movies =
          await getIt<ApiService>().fetchMovie(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch movies')),
        );
      }
    } finally {
      setState(() {
        _isfetching = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppbar(),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _movies.length + (_isfetching ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < _movies.length) {
                    return MoviesItem(
                      movies: _movies[index],
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
