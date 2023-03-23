part of 'custom_random_words_bloc.dart';

@immutable
abstract class CustomRandomWordsState {}

class CustomRandomWordsInitial extends CustomRandomWordsState {}
class CustromRandomWordsLoading extends CustomRandomWordsState{}
class CustromRandomWordsSuccess extends CustomRandomWordsState{
final List<dynamic> data;

  CustromRandomWordsSuccess(this.data);
}
class CustromRandomWordsfail extends CustomRandomWordsState{
  final String error;

  CustromRandomWordsfail(this.error);
  
}
