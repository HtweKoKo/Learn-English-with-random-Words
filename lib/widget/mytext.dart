import 'package:flutter/cupertino.dart';

Widget mytext({required text,required int? size,fontWeight,color}){
  return Text(text,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(
      color: color,
      fontSize:size!.toDouble(),
      fontWeight: fontWeight
  ),);
}