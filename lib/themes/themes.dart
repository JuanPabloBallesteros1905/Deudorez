import 'package:flutter/material.dart';

class Themes {

  static final themes = ThemeData.light().copyWith(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
       
       
        minimumSize: const Size(90, 50),
        shape: const StadiumBorder(),
        side: BorderSide(width: 1)
        

      )
    )
  ); 


}