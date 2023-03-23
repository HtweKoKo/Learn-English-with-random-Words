import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/data/rerpositary/wordRepo.dart';
import 'package:meta/meta.dart';

part 'custom_random_words_event.dart';
part 'custom_random_words_state.dart';

class CustomRandomWordsBloc extends Bloc<CustomRandomWordsEvent, CustomRandomWordsState> {
  WordRepo _wordRepo = WordRepo();
  CustomRandomWordsBloc() : super(CustomRandomWordsInitial()) {
    on<CustomRandomWordsEvent2>((event, emit) async {
      try {
  emit(CustromRandomWordsLoading());
  List<dynamic> response = await _wordRepo.getcustomRandomWords(
      counts: event.count,
      beginWiths: event.beginsWith,
      minwordlengths: event.minwordLength,
      excludes: event.exclude,
      includes: event.include);
  emit(CustromRandomWordsSuccess(response));
} on Exception catch (e) {
 emit(CustromRandomWordsfail(e.toString()));
}
    });
  }
}
