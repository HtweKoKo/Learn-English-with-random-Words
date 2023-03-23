part of 'drop_down_bloc.dart';

abstract class DropDownEvent extends Equatable {
  const DropDownEvent();

  @override
  List<Object> get props => [];
}

class DropDownEventLength extends DropDownEvent {
  final String length;

  DropDownEventLength({required this.length});
}
