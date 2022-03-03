import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/hive_models/celeb_model.dart';
import 'package:movie_review/data/hive_models/movie_model.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/hive_repository.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';
import 'package:movie_review/data/repositories/notification_repository.dart';
import 'package:movie_review/utils/apis/apis.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRespository movieRespository = MovieRespository();
  NotificationRepository notificationRepository = NotificationRepository();
  HiveRepository hiveRepository = HiveRepository();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LoadHomeData>((event, emit) => getHomeData(event, emit));
    on<LoadHomeDataOffline>((event, emit) => getCacheData(event, emit));
  }

  Future<void> getHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      List<Movie> movies = await movieRespository.getAllMovies();
      List<Movie> actionMovies = await movieRespository.getActionMovies();
      List<Celebs> celebs = await movieRespository.getAllCelebs();

      // await hiveRepository.clearAll();

      // for (var i = 0; i < movies.length; i++) {
      //   await hiveRepository.addMovies(MovieModel(
      //     id: movies[i].id!,
      //     title: movies[i].name!,
      //     date: movies[i].releaseDate!,
      //     image: API.baseUrl + movies[i].poster! as Uint8List,
      //   ));
      // }

      // for (var i = 0; i < celebs.length; i++) {
      //   await hiveRepository.addCelebs(CelebsModel(
      //     id: celebs[i].id!,
      //     fname: celebs[i].fname!,
      //     lname: celebs[i].lname!,
      //     image: celebs[i].image! as Uint8List,
      //   ));
      // }
      print("fsd");
      emit(HomeLoaded(
        movies: movies,
        celebs: celebs,
        actionMovies: actionMovies,
      ));
    } catch (e) {
      notificationRepository.notify();
      emit(HomeLoadFailed(message: e.toString()));
    }
  }

  Future<void> getCacheData(
      LoadHomeDataOffline event, Emitter<HomeState> emit) async {
    List data = await hiveRepository.getData();
    List<Movie> movies = data[0];
    List<Celebs> celebs = data[1];
    emit(HomeLoaded(
      movies: movies,
      celebs: celebs,
      actionMovies: [],
    ));
  }
}
