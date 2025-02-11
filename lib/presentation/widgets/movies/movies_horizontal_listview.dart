import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MoviesHorizontalListview extends StatelessWidget {
  
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  
  const MoviesHorizontalListview({super.key, required this.movies, this.title, this.subTitle, this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          if(title != null || subTitle != null)
            _Title(title: title, subTitle: subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              }
            )
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //*Image
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                fit: BoxFit.cover,
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15), 
                        child: CircularProgressIndicator(strokeWidth: 2)
                      )
                    );
                  }

                  return FadeIn(child: child);
              },
              ),
            )
          ),

          const SizedBox(height: 5),

          //*Title
            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                style: textStyles.titleSmall,
              ),
            ),

          //*Rating
            Flexible(
              child: Row(
                children: [
                  Icon(Icons.star_half_outlined, color: Colors.yellow[800]),
                  const SizedBox(width: 3),
                  Text('${movie.voteAverage}', style: textStyles.bodyMedium?.copyWith(color: Colors.yellow[800]),),
                  const SizedBox(width: 10),
                  Text('${movie.popularity}', style: textStyles.bodySmall,)
              
                ],
              ),
            )
        ]
      ),
    );
  }
}

class _Title extends StatelessWidget {

  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            if(title != null)
              Text(title!, style: titleStyle),
            
            const Spacer(),
        
            if(subTitle != null)
              FilledButton.tonal(
                onPressed: () {}, 
                child: Text(subTitle!),
                style: ButtonStyle(visualDensity: VisualDensity.compact,
              )
            )
          ],
        ),
      ),
    );
  }
}