import 'package:flutter/material.dart';
import 'package:flutter_movie_application/model/data/dummys_repository.dart';
import 'package:flutter_movie_application/model/response/movies_response.dart';
import 'package:flutter_movie_application/detail_page.dart';

class ListPage extends StatelessWidget {
  final List<Movie> movies = DummysRepository.loadDummyMovies();
  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => Divider(color: Colors.grey),
      itemCount: movies.length,
      itemBuilder: ((context, index) {
        // return ListItemWidget(movie: movies[index]);
        return InkWell(
          child: ListItemWidget(movie: movies[index]),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailPage(movieId: movies[index].id),
              ),
            );
          },
        );
      }),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final Movie movie;

  const ListItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(movie.thumb, height: 130),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ListItemGradeImageWidget(grade: movie.grade),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('평점 : ${movie.userRating / 2}'),
                    const SizedBox(width: 10),
                    Text('예매순위 : ${movie.reservationGrade}'),
                    const SizedBox(width: 10),
                    Text('예매율 : ${movie.reservationRate}')
                  ],
                ),
                const SizedBox(height: 10),
                Text('개봉일 : ${movie.date}')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListItemGradeImageWidget extends StatelessWidget {
  final int grade;

  const ListItemGradeImageWidget({super.key, required this.grade});

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
