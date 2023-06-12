import 'package:cinema_score/core/data/models/genre.dart';
import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/movie_flow/genre/list_card.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class GenreScreen extends StatefulWidget{
  GenreScreen({super.key, required this.nextPage, required this.previousPage});

  VoidCallback nextPage;
  VoidCallback previousPage;

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen>{
  List<Genre> genres = const [
    Genre(name: "Sci-fi"),
    Genre(name: 'Drama'),
    Genre(name: 'Comedy'),
    Genre(name: 'Horror'),
    Genre(name: 'Family'),
    Genre(name: 'Romance'),
    Genre(name: 'Animated'),
  ];

  void toggleSelected(Genre genre){
    List<Genre> updatedGenres = [
      for(final oldGenre in genres)
        if(oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];

    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Choose your favourite genre",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: mListItemSpacing),
                itemBuilder: (context, index){
                  final genre = genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index){
                  return const SizedBox(height: mListItemSpacing,);
                },
                itemCount: genres.length
              ),
            ),
            PrimaryButton(onPressed: widget.nextPage, text: "Continue"),
            const SizedBox(height: mMediumSpacing,)
          ],
        ),
      ),
    );
  }

}