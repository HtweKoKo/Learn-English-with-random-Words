import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/bloc/dropDownFrom/dropdown_from_bloc.dart';
import 'package:learnenglish/bloc/drpDownTo/dropdown_to_bloc.dart';
import 'package:learnenglish/bloc/translate/translate_bloc.dart';
import 'package:learnenglish/constant/color.dart';
import 'package:learnenglish/widget/customButtom.dart';
import 'package:learnenglish/widget/customTextfield.dart';
import 'package:learnenglish/widget/dropdownButton.dart';
import 'package:learnenglish/widget/myAppBar.dart';
import 'package:learnenglish/widget/mytext.dart';

class Translate extends StatelessWidget {
  final List<String> languagesName;
  final List<String> languageCode;
  Translate({required this.languagesName, required this.languageCode});
  int languageCodeIndexfrom = 28;
  int languageCodeIndexto = 1;
  @override
  Widget build(BuildContext context) {
   final TextEditingController textcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: myAppBar("Translate"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: primary,
                height: 320,
                child: Column(
                  children: [
                    Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<DropdownFromBloc, DropdownFromState>(
                              builder: (context, state) {
                                return DropDown(
                                    width: 140,
                                    suggestText: "Choose your language",
                                    dropdownValue: state.fromlanguage,
                                    onChanged: (value) {
                                      languageCodeIndexfrom =
                                          languagesName.indexWhere((element) =>
                                              element.contains(value!));

                                      context.read<DropdownFromBloc>().add(
                                          DropdownFromlanguage(
                                              fromlanguage: value!));
                                    },
                                    listItem: languagesName);
                              },
                            ),
                            BlocBuilder<DropdownToBloc, DropdownToState>(
                              builder: (context, state) {
                              
                                  return DropDown(
                                    width: 140,
                                    suggestText: "To",
                                    onChanged: (value) {
                                      languageCodeIndexto =
                                          languagesName.indexWhere((element) =>
                                              element.contains(value!));
                                      context.read<DropdownToBloc>().add(
                                          DropDownEventTo(
                                              ToLanguage: value!));
                                    },
                                    dropdownValue: state.toName,
                                    listItem: languagesName);
                                
                              
                              },
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: customTextfield(
                          hintText: "Enter text",
                          maxline: 8,
                          controller: textcontroller),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding:const EdgeInsets.only(right: 20),
                          child: customButton(
                            text: "Translate",
                            onTap: () {
                              context.read<TranslateBloc>().add(TranslateText(
                                  languageCodeFrom:
                                      languageCode[languageCodeIndexfrom],
                                  languageCodeTo:
                                      languageCode[languageCodeIndexto],
                                  text: [textcontroller.text]));
                            },
                          )),
                    )
                  ],
                )),

            // the following code will show Translate Data
            BlocBuilder<TranslateBloc, TranslateState>(
                builder: ((context, state) {
              if (state is TranslateLoading) {
                return const Padding(
                  padding:  EdgeInsets.only(top: 150),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is TranslateTextSuccess) {
                var data = state.textData;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: mytext(
                      text: data[0], size: 14, fontWeight: FontWeight.bold),
                );
              } else if (state is TranslateFail) {
                return Padding(
                    padding:const EdgeInsets.only(top: 20),
                    child: Center(
                        child:
                            mytext(text: state.error, size: 14, color: black)));
              }
              return Padding(
                padding:const EdgeInsets.only(top: 150),
                child: Center(
                    child: mytext(
                        text: "Translate", size: 30, color: dropdownTextColor)),
              );
            }))
          ],
        ),
      ),
    );
  }

  
}
