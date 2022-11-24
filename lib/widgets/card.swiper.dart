import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

import '../themes/themes.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> _moviesList;

  const CardSwiper({
    super.key,
    required List<Movie> movies,
  }): _moviesList = movies;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (_moviesList.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator(
          color: AppTheme.primary,
        )),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: _moviesList.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,

        itemBuilder: (_,i) {

          final movie = _moviesList[i];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details',
              arguments: 'movie-details',
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );

        },

      ),
    );

  }
}