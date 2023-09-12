import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;
  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: AppImages.moviePlacholder,
        title: 'Смертельная битва',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 2,
        imageName: AppImages.moviePlacholder,
        title: 'Форсаж 10',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 3,
        imageName: AppImages.moviePlacholder,
        title: 'Звездные войны 3',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 4,
        imageName: AppImages.moviePlacholder,
        title: 'Стражи галактики 4',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 5,
        imageName: AppImages.moviePlacholder,
        title: 'Мстители',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 6,
        imageName: AppImages.moviePlacholder,
        title: 'Битва титанов',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 7,
        imageName: AppImages.moviePlacholder,
        title: 'Джокер',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 8,
        imageName: AppImages.moviePlacholder,
        title: 'Джон Уик 4',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 9,
        imageName: AppImages.moviePlacholder,
        title: '1+1',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
    Movie(
        id: 10,
        imageName: AppImages.moviePlacholder,
        title: '2+1',
        time: 'May 30, 2023',
        description:
            'Джон Уик находит способ одержать победу над Правлением Кланов.'),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where(
        (Movie movie) {
          return movie.title.toLowerCase().contains(query.toLowerCase());
        },
      ).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTab(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _movies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          )
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.time,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onMovieTab(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
