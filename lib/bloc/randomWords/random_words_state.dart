part of 'random_words_bloc.dart';

@immutable
abstract class RandomWordsState {}

class RandomWordsInitial extends RandomWordsState {}

class RandomWordsLoading extends RandomWordsState {}

class RandomWordsSuccess extends RandomWordsState {
  final List<dynamic> response;

  RandomWordsSuccess(this.response);
}

class RandomWordsError extends RandomWordsState {
  final String error;

  RandomWordsError(this.error);
}
