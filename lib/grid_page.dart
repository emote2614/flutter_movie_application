import 'package:flutter/material.dart';
import 'package:flutter_movie_application/detail_page.dart';
import 'package:flutter_movie_application/model/data/dummys_repository.dart';
import 'package:flutter_movie_application/model/response/movies_response.dart';

class GridPage extends StatelessWidget {
  final List<Movie> movies = DummysRepository.loadDummyMovies();
  GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (9 / 16),
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) => GridItemWidget(movie: movies[index]),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final Movie movie;
  const GridItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Image.asset(
                    movie.thumb,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: GridItemGradeImageWidget(grade: movie.grade),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            FittedBox(
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
                '${movie.reservationGrade}위(${movie.userRating}) / ${movie.reservationRate}%'),
            const SizedBox(height: 8),
            Text(movie.date),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailPage(movieId: movie.id),
          ),
        );
      },
    );
  }
}

class GridItemGradeImageWidget extends StatelessWidget {
  final int grade;

  const GridItemGradeImageWidget({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    switch (grade) {
      case 0:
        return Image.asset(
          "images/all.png",
          width: 20,
        );
      case 12:
        return Image.asset(
          "images/12.png",
          width: 20,
        );
      case 15:
        return Image.asset(
          "images/15.png",
          width: 20,
        );
      case 18:
        return Image.asset(
          "images/18.png",
          width: 20,
        );
      default:
        return const SizedBox();
    }
  }
}
