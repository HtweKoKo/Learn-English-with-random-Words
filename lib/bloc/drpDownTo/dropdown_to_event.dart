part of 'dropdown_to_bloc.dart';

abstract class DropdownToEvent extends Equatable {
  const DropdownToEvent();

  @override
  List<Object> get props => [];
}
class DropDownEventTo extends DropdownToEvent{
    final String ToLanguage;

  DropDownEventTo({required this.ToLanguage});
  
}
