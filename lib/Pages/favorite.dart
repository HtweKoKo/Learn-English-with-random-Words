import 'package:flutter/material.dart';
import 'package:learnenglish/widget/myAppBar.dart';
import 'package:learnenglish/widget/mytext.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Favorite"),
      body: Center(child: mytext(text: "Coming Soon", size: 20)),
    );
  }
}