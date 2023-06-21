import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'feature_auth_event.dart';
part 'feature_auth_state.dart';

class FeatureAuthBloc extends Bloc<FeatureAuthEvent, FeatureAuthState> {
  FeatureAuthBloc() : super(FeatureAuthInitial()) {
    on<FeatureAuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
