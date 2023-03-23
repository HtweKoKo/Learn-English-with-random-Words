part of 'dropdown_from_bloc.dart';

abstract class DropdownFromEvent extends Equatable {
  const DropdownFromEvent();

  @override
  List<Object> get props => [];
}
class DropdownFromlanguage extends DropdownFromEvent{
  final String fromlanguage;


  DropdownFromlanguage({required this.fromlanguage,});
}
