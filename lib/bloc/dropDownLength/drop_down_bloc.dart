import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(DropDownInitial()) {
    on<DropDownEventLength>(_onDropDownEventLength);
  }

  void _onDropDownEventLength(
      DropDownEventLength event, Emitter<DropDownState> emit) {
    emit(DropDownState(length: event.length));
  }
}
