part of 'translate_bloc.dart';

abstract class TranslateEvent extends Equatable {
  const TranslateEvent();

  @override
  List<Object> get props => [];
}

class TranslateText extends TranslateEvent {
  final String languageCodeFrom;
  final String languageCodeTo;
  final List<String> text;

  const TranslateText(
      {required this.languageCodeFrom,
      required this.languageCodeTo,
      required this.text});
}
class TranslateWords extends TranslateEvent {
  final String languageCodeFrom;
  final String languageCodeTo;
  final List<String> text;

  const TranslateWords(
      {required this.languageCodeFrom,
      required this.languageCodeTo,
      required this.text});
}
