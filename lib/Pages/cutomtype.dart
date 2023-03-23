import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/Pages/customWords.dart';
import 'package:learnenglish/bloc/drpDownTo/dropdown_to_bloc.dart';
import 'package:learnenglish/constant/color.dart';
import 'package:learnenglish/widget/customButtom.dart';
import 'package:learnenglish/widget/dropdownButton.dart';
import 'package:learnenglish/widget/myAppBar.dart';

import '../widget/customTextfield.dart';

class CustomType extends StatelessWidget {
  final List<String> languageName, languageCode;
  CustomType({required this.languageName, required this.languageCode});

  final TextEditingController _minwordLength = TextEditingController();
  final TextEditingController _include = TextEditingController();
  final TextEditingController _exclude = TextEditingController();
  final TextEditingController _begin = TextEditingController();
  int languageCodeIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:myAppBar("CustomRandomText"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextfield(
                keyboardtype: TextInputType.number,
                controller: _minwordLength,
                hintText: " minium word length(eg.3)",
              ),
              const SizedBox(
                height: 20,
              ),
              customTextfield(
                controller: _include,
                hintText: "include letter(eg.s)",
              ),
              const SizedBox(
                height: 20,
              ),
              customTextfield(
                controller: _exclude,
                hintText: "exclude letter(eg.x)",
              ),
              const SizedBox(
                height: 20,
              ),
              customTextfield(
                controller: _begin,
                hintText: "begin with lettter(eg.g)",
              ),
              BlocBuilder<DropdownToBloc, DropdownToState>(
                builder: (context, state) {
                  return DropDown(
                      suggestText: "",
                      width: double.infinity,
                      listItem: languageName,
                      dropdownValue: state.toName,
                      onChanged: (value) {
                        languageCodeIndex = languageName
                            .indexWhere((element) => element.contains(value!));
                        // print(languageCodeIndex);
                        // print("$value ${languageCode[languageCodeIndex]}");
                        context.read<DropdownToBloc>().add(
                            DropDownEventTo(ToLanguage: value!));
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              customButton(
                  text: "Generate",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomWords(
                                  count: "7",
                                  minwordLength: _minwordLength.text,
                                  beginsWith: _begin.text,
                                  include: _include.text,
                                  exclude: _exclude.text,
                                  languageCode: languageCode[languageCodeIndex],
                                )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
