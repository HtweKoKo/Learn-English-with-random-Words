import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnenglish/Pages/Home.dart';
import 'package:learnenglish/Pages/cutomtype.dart';
import 'package:learnenglish/Pages/translate.dart';
import 'package:learnenglish/bloc/bottom_navi/bottom_navi_bloc.dart';
import 'package:learnenglish/constant/color.dart';

import 'favorite.dart';

class BottomTabScreen extends StatelessWidget {
  final List<String> languagesName;
  final List<String> languageCode;
   const BottomTabScreen({Key? key, required this.languagesName,required this.languageCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      { "pageName": Home(  languagesName: languagesName,
      languageCode: languageCode, ), },
      { "pageName": CustomType(languageName: languagesName,
      languageCode: languageCode, ),},
      { "pageName": Translate(languagesName: languagesName,
      languageCode: languageCode,), },
      {
        "pageName": Favorite(),
      },

    ];
    return BlocBuilder<BottomNaviBloc, BottomNaviState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop:(){
           return _onWillPop(context);
          } ,
          child: Scaffold(
              body: pages[state.index]["pageName"],
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  selectedLabelStyle: TextStyle(color: black),
                  unselectedLabelStyle: TextStyle(color: black),
                  currentIndex: state.index,
                  onTap: ((value) {
                    context
                        .read<BottomNaviBloc>()
                        .add(BottomNaviPageEvent(index: value));
                  }),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      label: "Custom word",
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Translate",
                      icon: Icon(
                        Icons.translate,
                        color: Colors.black,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Favorite",
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                    ),
                  ])),
        );
      },
    );
  }

 
  Future<bool> _onWillPop(context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:  Text('Are you sure?'),
            content:  Text('Do you want to exit this app'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child:  Text('No'),
              ),
              TextButton(
                onPressed: () =>
                SystemNavigator.pop(),
                    // Navigator.of(context).pop(true), // <-- SEE HERE
                child:  Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  }

