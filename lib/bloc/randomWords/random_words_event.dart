part of 'random_words_bloc.dart';

@immutable
abstract class RandomWordsEvent {}
class RandomWordsEvent2 extends RandomWordsEvent{
  final String count;

  RandomWordsEvent2(this.count);
}


