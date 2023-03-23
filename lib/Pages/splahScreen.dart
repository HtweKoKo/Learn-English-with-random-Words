import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/Pages/bottomTabScreen.dart';
import 'package:learnenglish/bloc/getLanguage/get_language_bloc.dart';
import 'package:learnenglish/constant/color.dart';
import 'package:learnenglish/widget/mytext.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key,}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  Widget build(BuildContext context) {
   context.read<GetLanguageBloc>().add(GetLanguageEvent2("en")); 
    List<String> dropDownItems = [];
    List<String> dataCode = [];

    return Scaffold(
        backgroundColor: primary,
        body: BlocBuilder<GetLanguageBloc, GetLanguageState>(
          builder: (context, state) {
            if (state is GEtLanguageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GEtLanguageSuccess) {
              var data = state.languageName;
              var datas = state.languageCode;
              dataCode = datas;
                dropDownItems = data;
              nextPage(context, dropDownItems,dataCode);
              return const SizedBox();
            } else if (state is GEtLanguageFail) {
              return Center(child: Text(state.errorString));
            }
            return mytext(text: "hello", size: 30);
          },
        ));
  }

  Future nextPage(BuildContext context, dropDownItems,dataCode) {
    return Future.delayed(
        const Duration(seconds: 0),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BottomTabScreen(languagesName: dropDownItems,languageCode: dataCode,))));
  }
}
