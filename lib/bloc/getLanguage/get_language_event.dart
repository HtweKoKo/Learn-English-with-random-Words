part of 'get_language_bloc.dart';

@immutable
abstract class GetLanguageEvent {}

class GetLanguageEvent2 extends GetLanguageEvent {
  final String languageCode;

  GetLanguageEvent2(this.languageCode);
}
