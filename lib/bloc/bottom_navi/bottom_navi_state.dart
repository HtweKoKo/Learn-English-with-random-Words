part of 'bottom_navi_bloc.dart';

 class BottomNaviState extends Equatable {
  final int  index ;
  const BottomNaviState({required this.index});
  
  @override
  List<Object> get props => [index];
}

class BottomNaviInitial extends BottomNaviState {
  const BottomNaviInitial({required super.index});
}
