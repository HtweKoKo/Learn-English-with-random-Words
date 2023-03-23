part of 'bottom_navi_bloc.dart';

abstract class BottomNaviEvent extends Equatable {

  final int index ;
  const BottomNaviEvent({required this.index});

  @override
  List<Object> get props => [index];

}

class BottomNaviPageEvent extends BottomNaviEvent{
  const BottomNaviPageEvent({required super.index});
 
}

