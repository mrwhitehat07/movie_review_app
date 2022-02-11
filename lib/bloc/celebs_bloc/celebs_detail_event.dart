part of 'celebs_detail_bloc.dart';

@immutable
abstract class CelebsDetailEvent {}

class LoadCelebsDetail extends CelebsDetailEvent {
  final int id;
  LoadCelebsDetail({
    required this.id
  });
}