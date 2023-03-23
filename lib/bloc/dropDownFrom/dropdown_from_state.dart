part of 'dropdown_from_bloc.dart';

 class DropdownFromState extends Equatable {

  final String fromlanguage;
  final int fromCode;

  DropdownFromState({
    this.fromlanguage = "English", 
    this.fromCode = 28});
  
  
  
  @override

List<Object?> get props => [fromlanguage,fromCode];
}

class DropdownFromInitial extends DropdownFromState {
 
  
}
