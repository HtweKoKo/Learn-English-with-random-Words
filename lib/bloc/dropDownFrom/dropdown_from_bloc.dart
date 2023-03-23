import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dropdown_from_event.dart';
part 'dropdown_from_state.dart';

class DropdownFromBloc extends Bloc<DropdownFromEvent, DropdownFromState> {
  DropdownFromBloc() : super(DropdownFromInitial()) {
    on<DropdownFromlanguage>((event, emit) {
     emit(DropdownFromState(
        fromlanguage: event.fromlanguage
     ));
    });
  }
}
