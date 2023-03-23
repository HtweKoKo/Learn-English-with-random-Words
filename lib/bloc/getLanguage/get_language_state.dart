part of 'get_language_bloc.dart';

@immutable
class GetLanguageState extends Equatable {
  List<Object?> get props => [];
}

class GetLanguageInitial extends GetLanguageState {}

class GEtLanguageLoading extends GetLanguageState {}

class GEtLanguageSuccess extends GetLanguageState {
  final List<String> languageName;
  final List<String> languageCode;
  GEtLanguageSuccess({required this.languageName,required this.languageCode});
}

class GEtLanguageFail extends GetLanguageState {
  final String errorString;

  GEtLanguageFail(this.errorString);
}
