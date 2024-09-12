import 'package:flutter/material.dart';
class  ThemeProvider with ChangeNotifier{
  var isDark=false;


  toggle() {
   isDark=(isDark)?false:true;
    notifyListeners();
  }


}