import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/bloc/customrandomWords/custom_random_words_bloc.dart';
import 'package:learnenglish/bloc/translate/translate_bloc.dart';
import 'package:learnenglish/widget/meainingShowWidget.dart';
import 'package:learnenglish/widget/myAppBar.dart';
import 'package:learnenglish/widget/mytext.dart';

class CustomWords extends StatefulWidget {
  final String count, beginsWith, include, exclude, minwordLength, languageCode;
 
   CustomWords(
      {Key? key,
      required this.count,
      required this.beginsWith,
      required this.include,
      required this.exclude,
      required this.minwordLength,
      required this.languageCode});

  @override
  State<CustomWords> createState() => _CustomWordsState();
}

class _CustomWordsState extends State<CustomWords> {
  final CustomRandomWordsBloc _customRandomWordsBloc = CustomRandomWordsBloc();
  @override
  void initState() {
    super.initState();

    _customRandomWordsBloc.add(CustomRandomWordsEvent2(
      minwordLength: widget.minwordLength,
      count: widget.count,
      include: widget.include,
      exclude: widget.exclude,
      beginsWith: widget.beginsWith,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _customRandomWordsBloc,
      child: Scaffold(
        appBar: myAppBar("Custom Random words"),
        body: BlocBuilder<CustomRandomWordsBloc, CustomRandomWordsState>(
            builder: ((context, state) {
          if (state is CustromRandomWordsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CustromRandomWordsSuccess) {
            List<String> translateWords = [];
            var data = state.data;
            for (var element in data) {
              translateWords.add(element);
            }

            context.read<TranslateBloc>().add(TranslateWords(
                languageCodeFrom: "en",
                languageCodeTo: widget.languageCode,
                text: translateWords));
            return BlocBuilder<TranslateBloc, TranslateState>(
              builder: (context, state) {
                if (state is TranslateLoading) {
                  return const SizedBox();
                } else if (state is TranslateWordsSuccess) {
                  var data = state.data;
                  return Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: MeaningShowWidget(data: data, words: translateWords),
                  );
                } else if (state is TranslateFail) {
                  return mytext(text: state.error, size: 20);
                }
                return const SizedBox();
              },
            );
          } else if (state is CustromRandomWordsfail) {
            var data = state.error;

            return Center(child: Text(data));
          }
          return const SizedBox();
        })),
      ),
    );
  }
}
