import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/data/rerpositary/translateRepo.dart';
import 'package:meta/meta.dart';

import '../../data/model/getlanguage.dart';

part 'get_language_event.dart';
part 'get_language_state.dart';

class GetLanguageBloc extends Bloc<GetLanguageEvent, GetLanguageState> {
  TranslateRepo translateRepo = TranslateRepo();
  List<String> listName = [];
  List<String> listCode = [];

  GetLanguageBloc() : super(GetLanguageInitial()) {
    on<GetLanguageEvent2>((event, emit)async {
      try {
  emit(GEtLanguageLoading());
  var data = await translateRepo.getlanguage(targetText: event.languageCode);
    data.forEach((element) {
      listName.add(element.name.toString());
      listCode.add(element.language.toString());
    },);
  emit(GEtLanguageSuccess(languageName: listName,languageCode: listCode));
} on Exception catch (e) {
 emit(GEtLanguageFail(e.toString()));
}
      
  });
    }
  }

 
