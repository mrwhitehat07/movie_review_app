import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRespository movieRespository = MovieRespository();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LoadHomeData>((event, emit) => getHomeData(event, emit));
  }

  Future<void> getHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      List<Movie> movies = await movieRespository.getAllMovies();
      List<Movie> actionMovies = await movieRespository.getActionMovies();
      List<Celebs> celebs = await movieRespository.getAllCelebs();
      emit(HomeLoaded(movies: movies, celebs: celebs, actionMovies: actionMovies,));
    } catch (e) {
      emit(HomeLoadFailed(message: e.toString()));
    }
  }
}
