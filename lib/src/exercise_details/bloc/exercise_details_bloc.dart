import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_api/exercise_api.dart';
import 'package:exercise_repository/exercise_repository.dart';

part 'exercise_details_event.dart';
part 'exercise_details_state.dart';

class ExerciseDetailsBloc
    extends Bloc<ExerciseDetailsEvent, ExerciseDetailsState> {
  ExerciseDetailsBloc({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(const ExerciseDetailsState()) {
    on<ExerciseDetailsLoadingRequested>(_onLoadingRequested);
  }

  final ExerciseRepository _exerciseRepository;

  void _onLoadingRequested(
    ExerciseDetailsLoadingRequested event,
    Emitter<ExerciseDetailsState> emit,
  ) {
    emit(state.copyWith(status: ExerciseDetailsStatus.loading));

    try {
      final exercise = _exerciseRepository.get(id: event.id);
      emit(
        state.copyWith(
          status: ExerciseDetailsStatus.success,
          exercise: exercise,
        ),
      );
    } on ExerciseNotFoundException catch (_) {
      emit(state.copyWith(status: ExerciseDetailsStatus.failure));
    }
  }
}
