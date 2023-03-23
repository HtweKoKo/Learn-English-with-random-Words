part of 'translate_bloc.dart';

abstract class TranslateState extends Equatable {
  @override
  List<Object> get props => [];
}

class TranslateInitial extends TranslateState {}

class TranslateLoading extends TranslateState {}

class TranslateTextSuccess extends TranslateState {
  final List<dynamic> textData;

  TranslateTextSuccess({required this.textData});
}

class TranslateWordsSuccess extends TranslateState {
  final List<dynamic> data;

  TranslateWordsSuccess({required this.data});
}

class TranslateFail extends TranslateState {
  final String error;

  TranslateFail({required this.error});
}
