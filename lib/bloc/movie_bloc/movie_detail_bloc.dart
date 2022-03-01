import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/models/review_model.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';
import 'package:movie_review/data/repositories/review_repository.dart';
import 'package:movie_review/data/repositories/secure_storage.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieRespository movieRespository = MovieRespository();
  ReviewRepository reviewRepository = ReviewRepository();
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) {});
    on<LoadMovieDetail>((event, emit) => getMovieDetails(event, emit));
    on<RateReview>((event, emit) => rateReview(event, emit));
  }

  Future<void> getMovieDetails(
      LoadMovieDetail event, Emitter<MovieDetailState> emit) async {
    try {
      emit(MovieDetailLoading());
      final data = await movieRespository.getMovieById(event.id);
      final review = await reviewRepository.getReviews(event.id);

      Movie movie = data[0];
      List<Celebs> celebs = data[1];
      emit(MovieDetailLoadSuccess(
        movie: movie,
        crews: celebs,
        review: review,
      ));
    } catch (e) {
      emit(MovieDetailLoadFailed(message: e.toString()));
    }
  }

  Future<void> rateReview(
      RateReview event, Emitter<MovieDetailState> emit) async {
    // try {
    // emit(MovieReviewing());
    String? token = await TokenStorage.readToken("token");
    final result =
        await reviewRepository.rateReviewMovie(event.id, event.review, token!);
    print(result);
    // emit(MovieReviewSuccess(message: result));
    // } catch (e) {
    //   emit(MovieReviewFailed(message: e.toString()));
    // }
  }
}
