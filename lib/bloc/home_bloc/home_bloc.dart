import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRespository _movieRespository = MovieRespository();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LoadHomeData>((event, emit) => getAllMovies(event, emit));
  }

  Future<void> getAllMovies(LoadHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      List<Movie> movies = await _movieRespository.getAllMovies();
      emit(HomeLoaded(movies: movies));
    } catch (e) {
      emit(HomeLoadFailed(message: e.toString()));
    }
  }
}
