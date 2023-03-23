import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnenglish/constant/color.dart';
import 'package:learnenglish/widget/mytext.dart';

class MeaningShowWidget extends StatelessWidget {
  final List<dynamic> data;
  final List<String> words;

   MeaningShowWidget({ required this.data, required this.words});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mytext(
                        text: words[index],
                        size: 18,
                        fontWeight: FontWeight.bold),
                    IconButton(onPressed: () {
                      
                    }, icon:const Icon(Icons.favorite))
                  ],
                ),
                mytext(
                    text: data[index],
                    size: 14,
                    fontWeight: FontWeight.bold,
                    color: dropdownTextColor),
                const Divider(
                  thickness: 1,
                  color: black,
                )
              ]);
        }));
  }
}
