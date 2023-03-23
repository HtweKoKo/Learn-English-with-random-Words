import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/data/rerpositary/wordRepo.dart';
import 'package:meta/meta.dart';

part 'random_words_event.dart';
part 'random_words_state.dart';

class RandomWordsBloc extends Bloc<RandomWordsEvent, RandomWordsState> {
  WordRepo _wordRepo = WordRepo();
  RandomWordsBloc() : super(RandomWordsInitial()) {
    on<RandomWordsEvent2>((event, emit) async {
      try {
        emit(RandomWordsLoading());
        var response = await _wordRepo.getWords(event.count);
        emit(RandomWordsSuccess(response));
      } on Exception catch (e) {
        emit(RandomWordsError(e.toString()));
      }
    });
  }
}
