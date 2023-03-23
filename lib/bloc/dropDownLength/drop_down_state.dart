part of 'drop_down_bloc.dart';

class DropDownState extends Equatable {
  final String length;

  DropDownState({
    this.length = "3",
  });

  @override
  List<Object> get props => [length];
}

class DropDownInitial extends DropDownState {}
