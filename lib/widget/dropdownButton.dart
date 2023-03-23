import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'mytext.dart';

class DropDown extends StatelessWidget {
  String? suggestText, dropdownValue;
  final List<String> listItem;
  final double width;
 Function(String ?) onChanged;

  DropDown({
    this.suggestText,
    required this.width,
    this.dropdownValue,
    required this.listItem,
   required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
   
        return Column(
          children: [
            mytext(text: suggestText, size: 14, color: white),
            Card(
              child: Container(
                width: width,
                height: 30,
                child: Center(
                  child: DropdownButton(
                      isExpanded: true,
                      isDense: true,
                      value: dropdownValue,
                      items: listItem
                          .map((String str) => DropdownMenuItem(
                              value: str,
                              child: SizedBox(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left:8.0),
                                    child: mytext(
                                        size: 14, text: str, color: black),
                                  ))))
                          .toList(),
                      onChanged:onChanged ),
                ),
              ),
            ),
          ],
        );
  
  }
}
