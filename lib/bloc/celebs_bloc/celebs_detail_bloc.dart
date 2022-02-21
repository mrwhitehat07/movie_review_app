import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/celebs_repository.dart';

part 'celebs_detail_event.dart';
part 'celebs_detail_state.dart';

class CelebsDetailBloc extends Bloc<CelebsDetailEvent, CelebsDetailState> {
  CelebsRespository celebsRespository = CelebsRespository();
  CelebsDetailBloc() : super(CelebsDetailInitial()) {
    on<CelebsDetailEvent>((event, emit) {});
    on<LoadCelebsDetail>((event, emit) => getCelebsDetail(event, emit));
  }

  Future<void> getCelebsDetail(
      LoadCelebsDetail event, Emitter<CelebsDetailState> emit) async {
    try {
      emit(CelebsDetailLoading());
      Celebs celebs = await celebsRespository.getCelebsById(event.id);
      List<Movie> celebsMovie = await celebsRespository.getCelebsMovies(event.id);
      emit(CelebsDetailLoadSuccess(celebs: celebs, movies: celebsMovie));
    } catch (e) {
      emit(CelebsDetailLoadFailed(message: e.toString()));
    }
  }
}
