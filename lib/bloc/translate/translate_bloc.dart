import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:learnenglish/data/rerpositary/translateRepo.dart';

part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  TranslateBloc() : super(TranslateInitial()) {
    TranslateRepo translateRepo = TranslateRepo();
    on<TranslateText>((event, emit) async {
        print("textCall Called");

      try {
        emit(TranslateLoading());
        var data = await translateRepo.translateText(
            languageCodeFrom: event.languageCodeFrom,
            languageCodeto: event.languageCodeTo,
            text: event.text);
        emit(TranslateTextSuccess(textData: data));
      } on Exception catch (e) {
        emit(TranslateFail(error: e.toString()));
      }
    });
    on<TranslateWords>(
      (event, emit) async {
        print("words Called");
        try {
          emit(TranslateLoading());
          var data = await translateRepo.translateText(
              languageCodeFrom: event.languageCodeFrom,
              languageCodeto: event.languageCodeTo,
              text: event.text);
          emit(TranslateWordsSuccess(data: data));
        } on Exception catch (e) {
          emit(TranslateFail(error: e.toString()));
        }
      },
    );
  }
}
