import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    logger.i(
      '''
onChange - ${bloc.runtimeType},  
current - ${change.currentState}, 
next - ${change.nextState}''',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
