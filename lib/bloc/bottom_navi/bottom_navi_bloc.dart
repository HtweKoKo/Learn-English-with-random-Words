import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navi_event.dart';
part 'bottom_navi_state.dart';

class BottomNaviBloc extends Bloc<BottomNaviEvent, BottomNaviState> {
  BottomNaviBloc() : super(BottomNaviInitial(index: 0)) {
    on<BottomNaviPageEvent>((event, emit) {
      emit(BottomNaviState(index: event.index));
   
   } );}
}
