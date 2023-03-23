import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/bloc/dropDownLength/drop_down_bloc.dart';
import 'package:learnenglish/bloc/drpDownTo/dropdown_to_bloc.dart';
import 'package:learnenglish/bloc/randomWords/random_words_bloc.dart';
import 'package:learnenglish/bloc/translate/translate_bloc.dart';
import 'package:learnenglish/constant/color.dart';
import 'package:learnenglish/constant/constant&text.dart';
import 'package:learnenglish/widget/customButtom.dart';
import 'package:learnenglish/widget/dropdownButton.dart';
import 'package:learnenglish/widget/meainingShowWidget.dart';
import 'package:learnenglish/widget/myAppBar.dart';
import 'package:learnenglish/widget/mytext.dart';


class Home extends StatelessWidget {
  final List<String> languagesName;
  final List<String> languageCode;
  Home({Key? key, required this.languagesName, required this.languageCode})
      : super(key: key);
  int languageCodeIndex = 1;
  @override
  Widget build(BuildContext context) {
    String wordIndex = "";
    return Scaffold(
      backgroundColor: bgColor,
      appBar: myAppBar("Learn English"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(color: primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: mytext(
                            text: "with random words",
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 15),

                      //------------>>>> RowDropDown
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<DropdownToBloc, DropdownToState>(
                            builder: (context, state) {
                              return DropDown(
                                  width: 140,
                                  suggestText: "Choose your language",
                                  dropdownValue: state.toName,
                                  onChanged: (value) {
                                    languageCodeIndex =
                                        languagesName.indexWhere((element) =>
                                            element.contains(value!));

                                    context.read<DropdownToBloc>().add(
                                        DropDownEventTo(ToLanguage: value!));
                                  },
                                  listItem: languagesName);
                            },
                          ),
                          BlocBuilder<DropDownBloc, DropDownState>(
                            builder: (context, state) {
                              wordIndex = state.length;
                              return DropDown(
                                  width: 140,
                                  suggestText: "length of random words",
                                  dropdownValue: state.length,
                                  onChanged: (value) {
                                 
                                    context.read<DropDownBloc>().add(
                                        DropDownEventLength(length: value!));
                                  },
                                  listItem: numberList);
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: BlocBuilder<RandomWordsBloc, RandomWordsState>(
                      builder: (context, state) {
                        return customButton(
                            text: "Learn",
                            onTap: () {
                              context
                                  .read<RandomWordsBloc>()
                                  .add(RandomWordsEvent2(wordIndex));
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //first We must call RandomWordApi,
            //and then we will get words user want
            BlocBuilder<RandomWordsBloc, RandomWordsState>(
              builder: (context, state) {
                // print("call aa");
                if (state is RandomWordsLoading) {
                  return const Padding(
                    padding:  EdgeInsets.only(top: 200),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is RandomWordsSuccess) {
                  var data = state.response;
                  List<String> words = [];
                  for (var element in data) {
                      words.add(element);
                    } //--------->>>>> We get RanndomWord---------

                  // We have to Translate these words, so Translate api is called

                  context.read<TranslateBloc>().add(TranslateWords(
                      languageCodeFrom: "en",
                      languageCodeTo: languageCode[languageCodeIndex],
                      text: words));
                  // print("$words ***");

                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: BlocBuilder<TranslateBloc, TranslateState>(
                          builder: (context, state) {
                        if (state is TranslateLoading) {
                          return const SizedBox();
                        } else if (state is TranslateWordsSuccess) {
                        
                          List<String> translateData = [];
                          var data = state.data;
                          //------->>>>> We will get Translate Data
                          return SizedBox(
                            height: 400,
                            child: MeaningShowWidget(data: data, words: words),
                          );
                        } else if (state is TranslateFail) {
                          return Text(state.error);
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Center(
                              child: mytext(
                                  text: "Something was wrong",
                                  size: 30,
                                  color: dropdownTextColor)),
                        );
                      }));
                } else if (state is RandomWordsError) {
                  return Center(child: Text(state.error));
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                      child: mytext(
                          text: "Words", size: 30, color: dropdownTextColor)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
