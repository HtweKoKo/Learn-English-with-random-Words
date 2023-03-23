part of 'custom_random_words_bloc.dart';


abstract class CustomRandomWordsEvent {}
class CustomRandomWordsEvent2 extends CustomRandomWordsEvent{
  final String minwordLength;
  final String include;
  final String count;
  final String exclude;
  
  final String beginsWith;

  CustomRandomWordsEvent2( {required this.minwordLength,required this.include,required this.count,required this.exclude,required this.beginsWith});
}
