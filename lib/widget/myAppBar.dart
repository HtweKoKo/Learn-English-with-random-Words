

import 'package:flutter/material.dart';
import 'package:learnenglish/constant/color.dart';
import 'package:learnenglish/widget/mytext.dart';

PreferredSizeWidget myAppBar(text){
  return AppBar(
    title: mytext(text: text, size: 24,fontWeight: FontWeight.bold),
    backgroundColor: primary,
    elevation: 0,
    automaticallyImplyLeading: false,
  );
}