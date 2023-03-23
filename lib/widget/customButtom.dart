import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'mytext.dart';

Widget customButton({text,Function()? onTap}){
    return  InkWell(
                    onTap: onTap,
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(child: mytext(size: 20,text:text,color: white,fontWeight: FontWeight.bold)),
    ));
}