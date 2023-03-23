 import 'package:flutter/material.dart';

import '../constant/color.dart';

TextFormField customTextfield({controller,hintText,maxline= 1,keyboardtype }) {
    return TextFormField(
      style:const TextStyle(color: black),
            keyboardType: keyboardtype,
            controller:controller ,
            maxLines: maxline,
              decoration:  InputDecoration(
                  hintText: "$hintText",
                fillColor: white,
                filled: true,
                focusedBorder:  const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: white
                  ),
                  borderRadius:BorderRadius.all( Radius.circular(5))),
                enabledBorder:  const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: white
                  ),
                  borderRadius: BorderRadius.all( Radius.circular(5))),
                contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5)
              ),
          );
  }