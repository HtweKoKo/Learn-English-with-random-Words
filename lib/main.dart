
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/bloc/bottom_navi/bottom_navi_bloc.dart';
import 'package:learnenglish/bloc/customrandomWords/custom_random_words_bloc.dart';
import 'package:learnenglish/bloc/dropDownFrom/dropdown_from_bloc.dart';
import 'package:learnenglish/bloc/drpDownTo/dropdown_to_bloc.dart';
import 'package:learnenglish/bloc/getLanguage/get_language_bloc.dart';
import 'package:learnenglish/bloc/randomWords/random_words_bloc.dart';
import 'package:learnenglish/bloc/translate/translate_bloc.dart';
import 'Pages/splahScreen.dart';
import 'bloc/dropDownLength/drop_down_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GetLanguageBloc()),
          BlocProvider(create: (context) => RandomWordsBloc()),
          BlocProvider(create: (context) => CustomRandomWordsBloc()),
          BlocProvider(create: (context) => BottomNaviBloc()),
          BlocProvider(create: (context) => DropDownBloc()),
          BlocProvider(create: (context) => TranslateBloc()),
          BlocProvider(create: (context) => DropdownToBloc()),
          BlocProvider(create: (context) => DropdownFromBloc()),
        ],
        child:const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
