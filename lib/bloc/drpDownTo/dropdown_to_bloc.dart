import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_to_event.dart';
part 'dropdown_to_state.dart';

class DropdownToBloc extends Bloc<DropdownToEvent, DropdownToState> {
  DropdownToBloc() : super(DropdownToInitial()) {
    on<DropDownEventTo>((event, emit) {
      emit(DropdownToState(toName: event.ToLanguage));
    });
  }
}
